/*
 * sysbee_app.h
 *
 *  Created on: Feb 9, 2022
 *      Author: Nicolas
 */

#ifndef INC_SYSBEE_APP_H_
#define INC_SYSBEE_APP_H_

#include "main.h"

//toutes les fonctions qui font fonctionner la carte
typedef enum {signal_off, signal_ok, signal_connecting, signal_swarming, signal_fault}led_states;
typedef enum {
	xbee_init,
	lora_init,
	scan_abeilles,
	calcul_trafic,
	standby_long,
	standby_court,
	alerte,
	standby_alerte,
	alerte_led
} fsm_states;

typedef enum
{
  XBEE_CMD_MODE_OK       = 0x00U,
  XBEE_CONFIG_OK		 = 0x00U,
  XBEE_CONFIG_ERROR		 = 0x01U,
  XBEE_CMD_MODE_ERROR    = 0x01U,
  XBEE_SEND_FRAME_OK     = 0x00U,
  XBEE_SEND_FRAME_ERROR  = 0x01U,
  XBEE_CMD_RECEIVED_OK   = 0x00U,
  XBEE_CMD_RECEIVED_NOK  = 0x01U,
  XBEE_CMD_TIMEOUT_MILLISEC 	 = 10000
} XBEE_StatusTypeDef;

extern uint32_t delta_trafic; //est calculé toutes les 10 secondes, correspond au nombre d'abeilles sorties sur cette période de temps

extern uint8_t codes_led[5][20][2]; //tableau contenant les différentes valeurs pour allumer les LEDs (et signaler un défaut ou un essaimage...)

extern uint32_t compteur_abeilles_entrantes;
extern uint32_t compteur_abeilles_sortantes;

extern uint8_t buffer_compteur_abeilles_entrantes[10];
extern uint8_t buffer_compteur_abeilles_sortantes[10];

void update_led(); //gère les signaux et codes affichés sur les LEDs
void update_trafic(); //met à jour delta_trafic
void xbee_send_alert(); //bon ça va je vais pas tout expliquer non plus


//Machine d'état du systeme

void sysbee_app_fsm(void);


#endif /* INC_SYSBEE_APP_H_ */
