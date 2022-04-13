/*
 * xbee_core.h
 *
 *  Created on: Feb 9, 2022
 *      Author: denis
 */

#ifndef INC_XBEE_CORE_H_
#define INC_XBEE_CORE_H_

#include "main.h"

#define XBEE_CMD_MODE 			"+++"    //répond Ok
#define XBEE_CMD_FACTORY_RESET	"ATRE\r" //répond Ok
#define XBEE_CMD_WRITE			"ATWR\r" //répond Ok
#define XBEE_CMD_READ			"ATRD\r"
#define XBEE_CMD_EXIT_CMD_MODE	"ATCN\r" //répond Ok
#define XBEE_CMD_MODE_RESP_OK 	"OK"

/**
  * @brief  Initialisation du module Xbee.
  * @retval uint8_t
  */

/**
  * @brief  Initialisation du module Xbee.
  * @retval uint8_t
  */

#define XBEE_FIELD					0
#define XBEE_VALUE					1
#define XBEE_FIELD_OR_VALUE_SIZE	5 //taille des chaines (champ ou valeurs)
#define XBEE_MAX_FIELD_NUMBER		5 //nombre de champs à configurer


extern int8_t xbeeDefaultConfig[XBEE_MAX_FIELD_NUMBER][2][XBEE_FIELD_OR_VALUE_SIZE];

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


#define XBEE_FRAME_SIZE 10 //AMODIFIER !!!!!

//Trame Zigbee
typedef struct {
	uint8_t sof; //start of frame 0x7E octet 1
	uint16_t length;				// octets 2 MSB et 3 LSB
	uint8_t apiIdentifier;			// octet 4 0x01 16bit addresse
	uint8_t frameID;				// octets 5 A mettre à 0
	uint16_t destAddress16;			// octets 6 et 7
	uint8_t option;					// octet 8 0x01 -> pour ne pas avoir de ACK
	uint8_t dataToSend[256];		// octet 9 et suivants
	uint8_t check_sum;				// dernier octet
} Trame_API_TXPacket_t;

typedef struct {
	uint8_t sof; //start of frame 0x7E octet 1
	uint16_t length;				// octets 2 MSB et 3 LSB
	uint8_t apiIdentifier;			// octet 4 0x81 16bit addresse
	uint16_t sourceAddress16;		// octets 5 et 6
	uint8_t RSSI;					// octet 7
	uint8_t option;					// octet 8
	uint8_t receivedData[256];		// octet 9 et suivants
	uint8_t check_sum;				// dernier octet
} Trame_API_RXPacket_t;

//adegager
struct frame{
    uint16_t length;
    uint8_t type;
    uint8_t id; //AT
    uint64_t address64;
    uint16_t address16;
    uint8_t option;
    uint8_t content[256];
    uint8_t content_index;
    uint8_t command_status[4]; //AT
    uint8_t check_sum;
    uint8_t check_sum_ok;
};
//l'idée est de faire une union entre receivedData et une structure de donnée propre à l'application
//et qui sera définie dans sysbee_app.h en extern of course
/*typedef union {

} XbeeFrameData_t; //données utiles de sysbee
*/

//Je fais le mariage du buffer de réception de l'USART avec notre Trame définie précédemment

typedef union {
	uint8_t					XbeeTxBuffer[XBEE_FRAME_SIZE];
	Trame_API_TXPacket_t	TrameAPITransmitRequest;
} XbeeDMATxData_t;

typedef union {
	uint8_t					XbeeRxBuffer[XBEE_FRAME_SIZE];
	Trame_API_RXPacket_t	TrameAPITransmitRequest; //0x01
} XbeeDMARxData_t;

extern XbeeDMARxData_t XbeeRxData;
extern XbeeDMATxData_t XbeeTxData;

//uint8_t xbee_init(void);
XBEE_StatusTypeDef XbeeConfig(void);
XBEE_StatusTypeDef XbeeSendCmdWaitOk(int8_t *commande);
XBEE_StatusTypeDef XbeeSendCmdWaitResp(int8_t *commande, int8_t *resp);
XBEE_StatusTypeDef XbeeSendFrame(void);
//uint8_t xbee_send_data(la trame a envoyer);
void xbee_send_string(uint8_t * string);



#endif /* INC_XBEE_CORE_H_ */
