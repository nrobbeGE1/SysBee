/*
 * ir_sensor_core.c
 *
 *  Created on: Feb 9, 2022
 *      Author: Nicolas
 */

#include "ir_sensor_core.h"

#define SEUIL_DECLENCHEMENT 110
sensors_states sensors_state[16] = {capteurs_libres};

uint32_t compteur_abeilles_entrantes = 0;
uint32_t compteur_abeilles_sortantes = 0;

uint8_t buffer_compteur_abeilles_entrantes[10];
uint8_t buffer_compteur_abeilles_sortantes[10];

uint8_t compteur_etats_sortie[16]; //compteur dédié aux transitions de la sortie d'une abeille
uint8_t compteur_etats_entree[16]; //compteur dédié aux transitions de l'entrée d'une abeille

uint8_t buffer_rangee_active[2]; //Debug : permet la visualisation de la rangée sur laquelle un évènement ou une E/S a lieu

uint8_t sensor_pair[16][2] = { //rangées de capteurs, 0 étant la rangée côté µC et 15 la rangée la plus éloignée du µC
 //exterieur, interieur
		{0 , 1 }, //position des capteurs inversée sur le PCB
		{3 , 2 },
		{5 , 4 },
		{7 , 6 },
		{15, 14},
		{13, 12},
		{11, 10},
		{9 , 8 },
		{17, 16},
		{19, 18},
		{21, 20},
		{23, 22},
		{31, 30},
		{29, 28},
		{27, 26},
		{25, 24}
};


void select_mux(uint8_t sel){ //selection du
	HAL_GPIO_WritePin(GPIOH, S0_Pin, (sel & 0b0001)>>0);
	HAL_GPIO_WritePin(GPIOA, S1_Pin, (sel & 0b0010)>>1);
	HAL_GPIO_WritePin(GPIOH, S2_Pin, (sel & 0b0100)>>2);
	HAL_GPIO_WritePin(GPIOC, S3_Pin, (sel & 0b1000)>>3);
}

void scan_sensors() {
	HAL_GPIO_WritePin(GPIOA, LED_EN_Pin, 1); //allume les LEDs des capteurs, à NE PAS OUBLIER !!! --> sinon pas de lecture :(
	for (int i = 0; i <= 15; i ++) scan_sensor_unit(i);
	HAL_GPIO_WritePin(GPIOA, LED_EN_Pin, 0); //éteint les LEDs des capteurs, à NE PAS OUBLIER !!! --> sinon plus de conso :(
}

void scan_sensor_unit(uint8_t rangee_active) {
	uint8_t sensor_pair_value = 0b11; //combine les lectures des 2 capteurs d'une rangée
	uint8_t capteur_ext; //lecture analogique du capteur extérieur
	uint8_t capteur_int; //lecture analogique du capteur intérieur

	sprintf(buffer_rangee_active, "%d", rangee_active);

	sprintf(buffer_compteur_abeilles_entrantes, "%lu", compteur_abeilles_entrantes);

	if (rangee_active > 7) { //pour les 8 dernières rangées (8 --> 15)
		hadc.Init.ScanConvMode = ADC_SCAN_DIRECTION_FORWARD;
		  if (HAL_ADC_Init(&hadc) != HAL_OK)
		  {
		    Error_Handler();
		  }

		select_mux(sensor_pair[rangee_active][0]);

		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_ext = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur extérieur sur le MUX1
		HAL_ADC_Stop(&hadc);

		select_mux(sensor_pair[rangee_active][1]);
		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_int = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur intérieur sur le MUX1
		HAL_ADC_Stop(&hadc);

		if (capteur_ext < SEUIL_DECLENCHEMENT) {
			sensor_pair_value = sensor_pair_value & 0b01;
		}
		if (capteur_int < SEUIL_DECLENCHEMENT) {
			sensor_pair_value = sensor_pair_value & 0b10;
		}
	}
	else {					  //pour les 8 premières rangées (0 --> 7)
		hadc.Init.ScanConvMode = ADC_SCAN_DIRECTION_BACKWARD;
		  if (HAL_ADC_Init(&hadc) != HAL_OK)
		  {
		    Error_Handler();
		  }

		select_mux(sensor_pair[rangee_active][0]);

		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_ext = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur extérieur sur le MUX2
		HAL_ADC_Stop(&hadc);

		select_mux(sensor_pair[rangee_active][1]);
		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_int = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur intérieur sur le MUX2
		HAL_ADC_Stop(&hadc);
		if (capteur_ext < SEUIL_DECLENCHEMENT) {
			sensor_pair_value = sensor_pair_value & 0b01;
		}
		if (capteur_int < SEUIL_DECLENCHEMENT) {
			sensor_pair_value = sensor_pair_value & 0b10;
		}
	}

	switch(sensors_state[rangee_active]) {
				  case capteurs_libres:
					  //visualisation sur la liaison UART pour Debug
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"capteurs libres rangee ", sizeof("capteurs libres rangee "), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);

					  compteur_etats_entree[rangee_active] = 0; //on réinitialise l'avancée dans le cycle d'entrée
					  compteur_etats_sortie[rangee_active] = 0; //on réinitialise l'avancée dans le cycle de sortie

					  if(sensor_pair_value == 0b01){ //si le capteur extérieur est occupé
						  compteur_etats_entree[rangee_active] += 1; //on avance dans le cycle d'entrée
						  sensors_state[rangee_active] = exterieur_occupe;
					  }

					  else if(sensor_pair_value == 0b10){ //si le capteur intérieur est occupé
						  compteur_etats_sortie[rangee_active] += 1; //on avance dans le cycle de sortie
						  sensors_state[rangee_active] = interieur_occupe;
					  }
				  break;

				  case exterieur_occupe:
					  //visualisation sur la liaison UART pour Debug
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"exterieur occupe rangee ", sizeof("exterieur occupe rangee "), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);

					  if(sensor_pair_value == 0b00) { //si les capteurs sont occupés
						  compteur_etats_entree[rangee_active] += 1; //on avance dans le cycle d'entree
						  sensors_state[rangee_active] = capteurs_occupes;
					  }

					  else if (sensor_pair_value == 0b11) { //si les capteurs sont libres
						  if (compteur_etats_sortie[rangee_active] >= 3) { //si on a fait 3 ou + étapes dans le cycle de sortie
							  compteur_abeilles_sortantes += 1; //une abeille est sortie, on incrémente le compteur

							  //visualisation sur la liaison UART pour Debug
							  HAL_UART_Transmit(&huart2, (uint8_t*)"abeille sortie rangee ", sizeof("abeille sortie rangee "), HAL_MAX_DELAY);
							  HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
							  HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);
						  }
						  sensors_state[rangee_active] = capteurs_libres;
					  }

				  break;

				  case capteurs_occupes:
					  //visualisation sur la liaison UART pour Debug
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"capteurs occupes rangee ", sizeof("capteurs occupes rangee "), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);

					  if(sensor_pair_value == 0b10) { //si le capteur intérieur est occupé
						  compteur_etats_entree[rangee_active] += 1; //on avance dans le cycle d'entrée
						  sensors_state[rangee_active] = interieur_occupe;
					  }

					  else if (sensor_pair_value == 0b01) { //si le capteur extérieur est occupé
						  compteur_etats_sortie[rangee_active] += 1; //on avance dans le cycle de sortie
						  sensors_state[rangee_active] = exterieur_occupe;
					  }

					  else if(sensor_pair_value == 0b11) { //si les capteurs sont libres
						  sensors_state[rangee_active] = capteurs_libres;  //on revient à l'état capteurs_libres
					  }
				  break;

				  case interieur_occupe:
					  //visualisation sur la liaison UART pour Debug
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"interieur occupe rangee ", sizeof("interieur occupe rangee "), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
					  //HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);

					  if(sensor_pair_value == 0b11) { //si les capteurs sont libres
						  if (compteur_etats_entree[rangee_active] >= 3) { //si on a fait 3 ou + étapes dans le cycle d'entrée
							  compteur_abeilles_entrantes += 1; //une abeille est entree, on incrémente le compteur

							  //visualisation sur la liaison UART pour Debug
							  HAL_UART_Transmit(&huart2, (uint8_t*)"abeille entree rangee ", sizeof("abeille entree rangee "), HAL_MAX_DELAY);
							  HAL_UART_Transmit(&huart2, buffer_rangee_active, sizeof(buffer_rangee_active), HAL_MAX_DELAY);
							  HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);
						  }
						  sensors_state[rangee_active] = capteurs_libres;  //on revient à l'état capteurs_libres
					  }

					  else if (sensor_pair_value == 0b00) { //si les capteurs sont occupés
						  compteur_etats_sortie[rangee_active] += 1; //on avance dans le cycle de sortie
						  sensors_state[rangee_active] = capteurs_occupes;
					  }
				  break;
			  }
}

void debug_sensor_unit(uint8_t rangee_active) {
	uint8_t capteur_ext, capteur_int;
	uint8_t buffer_capteur[50
						   ];
	  HAL_GPIO_WritePin(GPIOA, LED_EN_Pin, 1); //allume les LEDs des capteurs, à NE PAS OUBLIER !!! --> sinon pas de lecture :(
	  select_mux(sensor_pair[rangee_active][0]);

		hadc.Init.ScanConvMode = ADC_SCAN_DIRECTION_FORWARD;
		  if (HAL_ADC_Init(&hadc) != HAL_OK)
		  {
		    Error_Handler();
		  }

		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_ext = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur extérieur sur le MUX1
		HAL_ADC_Stop(&hadc);

		select_mux(sensor_pair[rangee_active][1]);
		HAL_ADC_Start(&hadc);
		HAL_ADC_PollForConversion(&hadc, 1);
		capteur_int = (uint8_t)HAL_ADC_GetValue(&hadc); //lecture du capteur intérieur sur le MUX1
		HAL_ADC_Stop(&hadc);

		sprintf(buffer_capteur, "int %d ext%d\r\n", capteur_int, capteur_ext);
		HAL_UART_Transmit(&huart2, buffer_capteur, sizeof(buffer_capteur), HAL_MAX_DELAY);
}


