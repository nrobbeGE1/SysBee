/*
 * ir_sensor_core.h
 *
 *  Created on: Feb 9, 2022
 *      Author: Nicolas
 */

#ifndef INC_IR_SENSOR_CORE_H_
#define INC_IR_SENSOR_CORE_H_

#include "main.h"

//toutes les fonctions et variables qui gèrent le scan des porches optiques
typedef enum {capteurs_libres, exterieur_occupe, capteurs_occupes, interieur_occupe} sensors_states; //tous les états possibles de l'automate de comptage
extern sensors_states sensors_state[16];
extern ADC_HandleTypeDef hadc;

extern uint8_t sensor_pair[16][2]; //rangées de capteurs, 0 étant la rangée côté µC et 15 la rangée la plus éloignée du µC


extern uint32_t compteur_abeilles_entrantes;
extern uint32_t compteur_abeilles_sortantes;

extern uint8_t buffer_compteur_abeilles_entrantes[10];
extern uint8_t buffer_compteur_abeilles_sortantes[10];

extern uint8_t compteur_etats_sortie[16]; //compteur dédié aux transitions de la sortie d'une abeille
extern uint8_t compteur_etats_entree[16]; //compteur dédié aux transitions de l'entrée d'une abeille

extern uint8_t buffer_rangee_active[10]; //Debug : permet la visualisation de la rangée sur laquelle un évènement ou une E/S a lieu

void select_mux(uint8_t row_sel);
void scan_sensors();
void scan_sensor_unit(uint8_t rangee_active);
void debug_sensors();
void debug_sensor_unit(uint8_t rangee_active);


#endif /* INC_IR_SENSOR_CORE_H_ */
