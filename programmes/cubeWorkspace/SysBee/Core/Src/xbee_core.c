#include "main.h"
#include "xbee_core.h"
#include "stm32l0xx_hal.h"

/*Problèmes rencontrés :
 * initialisation uart avant dma, ce qui fait que le dma ne marche pas
 * envoi usart via dma et envoi avec usart sans dma (ce dernier ce prend les pieds dans le tapis, car visiblement l'autre est occupé...)
 *
 * */
/*int8_t step = 0;*/


int8_t xbeeDefaultConfig[XBEE_MAX_FIELD_NUMBER][2][XBEE_FIELD_OR_VALUE_SIZE] = { //première dimension : ligne, deuxième dimension colonne, troisième dimension : taille de chaines champ 1 et champ 2
	{"CH", "C"}, 	// network id
	{"ID", "2022"}, // network id
	{"NI", "C2"}, 	// node id
	{"CE", "1"},	// coordinator mode
	{"AP", "1"}  	// API enable

};


XbeeDMARxData_t XbeeRxData;
XbeeDMATxData_t XbeeTxData;

XBEE_StatusTypeDef XbeeSendFrame(void)
{
	unsigned char txbuffer[] = {0x7E, 0x00, 0x11, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x62, 0x6C, 0x61, 0xC4};
	if (HAL_OK != HAL_UART_Transmit_DMA(&huart1, txbuffer, 22))     	// Fire Transmission DMA
	{
		return XBEE_SEND_FRAME_ERROR; //pas de chances
	}
	else return XBEE_SEND_FRAME_OK;
}

void xbee_send_string(uint8_t * string){
	struct frame tx_frame = {0};
	tx_frame.length = 0x0E + strlen(string);
	//invert_lsB_msB((uint64_t*)&tx_frame.length, 2); //utilisée sur le F446RE, le L073CZ a un paramètre MSBFirst, réglé à 1 dans le .ioc
	tx_frame.type = 0x10;
	tx_frame.id = 0x01;
	tx_frame.address64 = 0xFFFF;
	//invert_lsB_msB((uint64_t*)&tx_frame.address64, 8); //utilisée sur le F446RE, le L073CZ a un paramètre MSBFirst, réglé à 1 dans le .ioc
	tx_frame.address16 = 0xFFFE;
	//invert_lsB_msB((uint64_t*)&tx_frame.address16, 2); //utilisée sur le F446RE, le L073CZ a un paramètre MSBFirst, réglé à 1 dans le .ioc
	memcpy(tx_frame.content, string, strlen(string));

	uint64_t sum = 0;
	uint16_t frame_length;
	frame_length = 275;
	uint8_t * ptr = (void *)&tx_frame+2;
	for(uint16_t i=0; i<frame_length-2; i++){
		sum += *ptr;
		ptr++;
	}

	tx_frame.check_sum = 0xFF - (sum & 0xFF);


	HAL_UART_Transmit(&huart1, "~", 1, 100);
	HAL_UART_Transmit(&huart1, (uint8_t*)&tx_frame.length, 2, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.type, 1, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.id, 1, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.address64, 8, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.address16, 2, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.content_index, 1, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.option, 1, 100);
	HAL_UART_Transmit(&huart1, &tx_frame.content, strlen(string), 100);
	HAL_UART_Transmit(&huart1, &tx_frame.check_sum, 1, 100);
}



XBEE_StatusTypeDef XbeeConfig(void)
{
	//uint8_t commande[XBEE_FIELD_OR_VALUE_SIZE];
	//on commence par un factory Reset ATRE, c'est un peu violent mais bon...

	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_MODE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk("ATID2022\r"))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk("ATNIC2\r"))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}

	//fige la configuration
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_WRITE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	//sort du mode commande
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_EXIT_CMD_MODE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	else
		return XBEE_CONFIG_OK; //ciao bye
}

XBEE_StatusTypeDef XbeeSendCmdWaitOk(int8_t *commande)
{
	int8_t res = 0;
	uint16_t *RxLen;

	//avant d'envoyer notre commande, je prend une photo
	memset(XbeeRxData.XbeeRxBuffer, '\0',XBEE_FRAME_SIZE);

		strcpy(XbeeTxData.XbeeTxBuffer, commande);     //Prépare la trame à être envoyée //le faire par envoi d'argument !!
		if (HAL_OK != HAL_UART_Transmit(&huart1, XbeeTxData.XbeeTxBuffer, strlen(commande),HAL_MAX_DELAY))     	// Fire Transmission DMA //Attention, ne pas utiliser sizeof ca met un caractère en plus et le +++ ne passe plus
		{
			res = HAL_ERROR; //pas de chances
			Error_Handler();
		}
		else //il n'y a pas eu de soucis de ce côté
		{
			//on repoiraute tant qu'on a pas reçu d'interruption USART-iDLE prise en charge dans le main (HAL_UART_RxCpltCallback) ou plutôt HAL_UARTEx_RxEventCallback
			//ET tant qu'on est en dessous du timeout
			//je reste planté tant que xbee_usart1_rx_flag n'est pas HAL_OK, mais je dois absolument dégager si :
			// timeout

			if (HAL_OK != HAL_UARTEx_ReceiveToIdle(&huart1, XbeeRxData.XbeeRxBuffer, 10, &RxLen, HAL_MAX_DELAY))
			{
				res = HAL_ERROR; //pas de chances
				Error_Handler();
			}
			else // tutto bene
			{
				res = HAL_OK;
				//et maintenant, on compare à ce qu'on devrait recevoir à savoir "OK"
				if (strncmp(XbeeRxData.XbeeRxBuffer, XBEE_CMD_MODE_RESP_OK,2) == 0)
				{
					  //tutto bene (on change un peu la logique d'utilisation du if histoire de...)
					  res = XBEE_CMD_RECEIVED_OK;
				}
				else
				{
					res = XBEE_CMD_RECEIVED_NOK;
				}
			}

	}
	return res;
}

XBEE_StatusTypeDef XbeeSendCmdWaitResp(int8_t commande[], int8_t *resp)
{
	int8_t res = 0;
	uint16_t *RxLen;

	//on reset le buffer de réception histoire de mettre des \0
	memset(XbeeRxData.XbeeRxBuffer, '\0',XBEE_FRAME_SIZE);


	memcpy(XbeeTxData.XbeeTxBuffer, commande,strlen(commande));     //Prépare la trame à être envoyée //le faire par envoi d'argument !!
	if (HAL_OK != HAL_UART_Transmit(&huart1, XbeeTxData.XbeeTxBuffer, strlen(commande), HAL_MAX_DELAY))     	// Fire Transmission DMA //Attention, ne pas utiliser sizeof ca met un caractère en plus et le +++ ne passe plus
	{
		res = HAL_ERROR; //pas de chances
		Error_Handler();
	}
	else //il n'y a pas eu de soucis de ce côté
	{
		if (HAL_OK != HAL_UARTEx_ReceiveToIdle(&huart1, XbeeRxData.XbeeRxBuffer, 10, &RxLen, 1000))
		{
			res = HAL_ERROR; //pas de chances
			Error_Handler();
		}
		else // tutto bene
		{
			res = XBEE_CMD_RECEIVED_OK;
			//uint8_t i = (uint8_t)*RxLen;

			strcpy (resp,XbeeRxData.XbeeRxBuffer);
			//strncpy (resp,XbeeRxData.XbeeRxBuffer,RxLen);
		}
	}
	return res;
}
