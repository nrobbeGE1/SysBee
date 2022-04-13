/*
 * sysbee_app.c
 *
 *  Created on: Feb 9, 2022
 *      Author: Nicolas
 */

#include "sysbee_app.h"

led_states led_state = signal_off;
fsm_states etat_futur = xbee_init;

uint32_t delta_trafic; //est calculé toutes les 10 secondes, correspond au nombre d'abeilles sorties sur cette période de temps

uint8_t codes_led[5][20][2] = { //tableau contenant les différentes valeurs pour allumer les LEDs (et signaler un défaut ou un essaimage...)
		{     // R, V
				{0, 0}, //off
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0}
		}, {
				{0, 1}, //ok
				{0, 0},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0},
				{0, 0}
		}, {
				{0, 1}, //connecting
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0},
				{0, 1},
				{0, 0}
		}, {
				{1, 0}, //swarming
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1},
				{1, 0},
				{0, 1}
		}, {
				{1, 0}, //fault
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0},
				{1, 0},
				{0, 0}
		}
};

void update_trafic(){ //met à jour delta_trafic
	static uint32_t old_compteur_abeilles_sortantes = 0;

#if VIEW_DEBUG
	//visualisation sur la liaison UART
	HAL_UART_Transmit(&huart2, (uint8_t*)"nombre d'abeilles sortantes : ", sizeof("nombre d'abeilles sortantes : "), HAL_MAX_DELAY);
	sprintf((uint8_t*)buffer_compteur_abeilles_sortantes, "%lu", compteur_abeilles_sortantes);
	HAL_UART_Transmit(&huart2, buffer_compteur_abeilles_sortantes, sizeof(buffer_compteur_abeilles_sortantes), HAL_MAX_DELAY);
	HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);

	HAL_UART_Transmit(&huart2, (uint8_t*)"nombre d'abeilles entrantes : ", sizeof("nombre d'abeilles entrantes : "), HAL_MAX_DELAY);
	sprintf((uint8_t*)buffer_compteur_abeilles_entrantes, "%lu", compteur_abeilles_entrantes);
	HAL_UART_Transmit(&huart2, buffer_compteur_abeilles_entrantes, sizeof(buffer_compteur_abeilles_entrantes), HAL_MAX_DELAY);
	HAL_UART_Transmit(&huart2, (uint8_t*)"\r\n", sizeof("\r\n"), HAL_MAX_DELAY);
#endif

	delta_trafic = (compteur_abeilles_sortantes - old_compteur_abeilles_sortantes) / 10; //mise à jour de delta_trafic (division par 10 pour revenir à une valeur en abeille/seconde, on calcule toutes les 10 secondes)

	if (delta_trafic > PALIER_TRAFIC_ALERTE) {
#if VIEW_DEBUG
		//visualisation sur la liaison UART
		HAL_UART_Transmit(&huart2, (uint8_t*)"ESSAIMAGE\r\n", sizeof("ESSAIMAGE\r\n"), HAL_MAX_DELAY);
#endif
		xbee_send_alert();
	}

	old_compteur_abeilles_sortantes = compteur_abeilles_sortantes; //on stocke la valeur actuelle du compteur pour l'éxécution suivante
}

void xbee_send_alert(){
//A ECRIRE
}

void update_led(){ //gère les signaux et codes affichés sur les LEDs
	static uint8_t i = 0;
	HAL_GPIO_WritePin(GPIOB, LED_R_Pin, codes_led[led_state][i][0]);
	HAL_GPIO_WritePin(GPIOB, LED_V_Pin, codes_led[led_state][i][1]);
	i = (i+1)%20;
}

void sysbee_app_fsm(void) {
	static fsm_states etat_actuel = scan_abeilles;
	static XBEE_StatusTypeDef xbee_config_status = XBEE_CONFIG_ERROR;
	etat_actuel = etat_futur;

	switch(etat_actuel){
			  	  case xbee_init:
			  		  if (xbee_config_status == XBEE_CONFIG_OK) etat_futur = scan_abeilles; //et qu'on n'est pas coord (check gpio)
			  		  //else led_state = signal_fault;
			  	  break;
			  	  case lora_init:
			  		  //à implémenter (bon courage  hihi)
			  	  break;
			  	  case scan_abeilles:

			  	  break;
			  	  case calcul_trafic:

			  	  break;
			  	  case standby_long:

			  	  break;
			  	  case standby_court:

			  	  break;
			  	  case alerte:

			  	  break;
			  	  case standby_alerte:

			  	  break;
			  	  case alerte_led:

			  	  break;
		}
	switch(etat_actuel){
	  	  case xbee_init:
	  		  xbee_config_status = XbeeConfig();
	  		  HAL_TIM_Base_Start_IT(&htim21); //fonction lancement timer
	  	  break;
	  	  case lora_init:
	  		  //à implémenter (bon courage  hihi)
	  		  HAL_TIM_Base_Start_IT(&htim21); //fonction lancement timer
	  	  break;
	  	  case scan_abeilles:
	  		  if (scan_abeilles_flag) scan_sensors();

	  		  scan_abeilles_flag = 0;
	  	  break;
	  	  case calcul_trafic:
	  		  if (calcul_trafic_flag) update_trafic();
	  		  calcul_trafic_flag = 0;
	  	  break;
	  	  case standby_long:

	  	  break;
	  	  case standby_court:

	  	  break;
	  	  case alerte:

	  	  break;
	  	  case standby_alerte:

	  	  break;
	  	  case alerte_led:
	  		  led_state = signal_swarming;
	  	  break;
}
}

