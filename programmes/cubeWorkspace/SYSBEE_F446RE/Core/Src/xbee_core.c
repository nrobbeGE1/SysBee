#include "xbee_core.h"

/*Problèmes rencontrés :
 * initialisation uart avant dma, ce qui fait que le dma ne marche pas
 * envoi usart via dma et envoi avec usart sans dma (ce dernier ce prend les pieds dans le tapis, car visiblement l'autre est occupé...)
 *
 * */
/*int8_t step = 0;*/

XBEE_StatusTypeDef XbeeSendFrame(void)
{
	unsigned char txbuffer[] = {0x7E, 0x00, 0x11, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 0x62, 0x6C, 0x61, 0xC4};
	if (HAL_OK != HAL_UART_Transmit_DMA(&huart1, txbuffer, 22))     	// Fire Transmission DMA
	{
		return HAL_ERROR; //pas de chances
	}
}


void invert_lsB_msB(uint64_t * var, uint8_t length){
	uint64_t new_var = 0;
	for(uint8_t i=0; i<length; i++){
		uint64_t byte = (*var & (0xFF<<(8*i)))>>(8*i);
		new_var += byte<<((length-1-i)*8);
	}

	*var = new_var;
}

void xbee_send_string(uint8_t * string){
	struct frame tx_frame = {0};
	tx_frame.length = 0x0E + strlen(string);
	invert_lsB_msB((uint64_t*)&tx_frame.length, 2);
	tx_frame.type = 0x10;
	tx_frame.id = 0x01;
	tx_frame.address64 = 0xFFFF;
	invert_lsB_msB((uint64_t*)&tx_frame.address64, 8);
	tx_frame.address16 = 0xFFFE;
	invert_lsB_msB((uint64_t*)&tx_frame.address16, 2);
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
	uint8_t commande[XBEE_FIELD_OR_VALUE_SIZE];
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
		return XBEE_CMD_MODE_OK; //ciao bye
}



/*XBEE_StatusTypeDef XbeeReadConfig(int8_t *commande)
{
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitResp(commande))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	//on lit

}*/





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
			uint8_t i = (uint8_t)*RxLen;

			strcpy (resp,XbeeRxData.XbeeRxBuffer);
			//strncpy (resp,XbeeRxData.XbeeRxBuffer,RxLen);
		}
	}
	return res;
}






/*XBEE_StatusTypeDef XbeeSendCmdWaitOk(int8_t *commande)
{
	int8_t res = 0;
	uint32_t lastTickTmestamp = 0;
	HAL_DMA_StateTypeDef dma_status;
	//avant d'envoyer notre commande, je prend une photo
	lastTickTmestamp = HAL_GetTick();

	while(HAL_DMA_STATE_READY != HAL_DMA_GetState(&hdma_usart1_rx));
	if (HAL_OK != HAL_UARTEx_ReceiveToIdle_DMA(&huart1, XbeeRxData.XbeeRxBuffer, 3)) 				//Fire Reception DMA on attend OK\r donc 3 octets !!!
	{
		res = HAL_ERROR;
		Error_Handler(); //ah malheur
	}//si ca a marché, l'UART est BUSY : HAL_UART_STATE_BUSY_RX
	else //il n'y a pas eu de soucis de ce côté, on peut envoyer le reste
	{
		strcpy(XbeeTxData.XbeeTxBuffer, commande);     //Prépare la trame à être envoyée //le faire par envoi d'argument !!

		while(HAL_DMA_STATE_READY != HAL_DMA_GetState(&hdma_usart1_tx));
		if (HAL_OK != HAL_UART_Transmit_DMA(&huart1, XbeeTxData.XbeeTxBuffer, strlen(commande)))     	// Fire Transmission DMA //Attention, ne pas utiliser sizeof ca met un caractère en plus et le +++ ne passe plus
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
			while ((xbee_usart1_rx_flag != HAL_OK) && (HAL_GetTick() < lastTickTmestamp + XBEE_CMD_TIMEOUT_MILLISEC));
			if (xbee_usart1_rx_flag != HAL_OK) //on y entre car il y a eu timeout
			{
				res = HAL_ERROR;
			}
			else // tutto bene
			{
				xbee_usart1_rx_flag == HAL_ERROR;
				res = HAL_OK;
				//et maintenant, on compare à ce qu'on devrait recevoir à savoir "OK"
				if ((xbee_usart1_rx_size != HAL_OK) && (strncmp(XbeeRxData.XbeeRxBuffer, XBEE_CMD_MODE_RESP_OK,2) == 0))
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
	}
	return res;
}*/



/*XBEE_StatusTypeDef XbeeSendCmdWaitResp(int8_t commande[], int8_t *resp)
{
	int8_t res = 0;
	uint32_t lastTickTmestamp = 0;

	//avant d'envoyer notre commande, je prend une photo
	lastTickTmestamp = HAL_GetTick();

	while(HAL_DMA_STATE_READY != HAL_DMA_GetState(&hdma_usart1_rx));
	if (HAL_OK != HAL_UARTEx_ReceiveToIdle_DMA(&huart1, XbeeRxData.XbeeRxBuffer, 10)) 				//Fire Reception DMA
	{
		res = HAL_ERROR;
		Error_Handler(); //ah malheur
	}
	else //Quant tout va bien on continue
	{
		strcpy(XbeeTxData.XbeeTxBuffer, "ATID\r");     //Prépare la trame à être envoyée //le faire par envoi d'argument !!
		while(HAL_DMA_STATE_READY != HAL_DMA_GetState(&hdma_usart1_tx));
		if (HAL_OK != HAL_UART_Transmit_DMA(&huart1, XbeeTxData.XbeeTxBuffer, 6))     	// Fire Transmission DMA
		{
			res = HAL_ERROR; //pas de chances
			Error_Handler();
		}
		else
		{
			//on poiraute tant qu'on a pas reçu d'interruption USARTiDLE prise en charge dans le main (HAL_UART_RxCpltCallback)
			//et tant qu'on est en dessous du timeout
			//je reste planté tant que xbee_usart1_rx_flag n'est pas HAL_OK, mais je dois dégager si :
			// timeout
			while ((xbee_usart1_rx_flag != HAL_OK) && (HAL_GetTick() < lastTickTmestamp + XBEE_CMD_TIMEOUT_MILLISEC));

			if (xbee_usart1_rx_flag != HAL_OK) //on y entre car il y a eu timeout
				res = HAL_ERROR;
			else // tutto bene, pas de timeout
			{
				xbee_usart1_rx_flag == HAL_ERROR;
				res = HAL_OK;

				if (xbee_usart1_rx_size != 0)
				{
					  //tutto bene (on a recu qqchose)
					  res = XBEE_CMD_RECEIVED_OK;
					  memcpy (resp,XbeeRxData.XbeeRxBuffer,sizeof(XbeeRxData.XbeeRxBuffer));
				}
				else
				{
					  res = XBEE_CMD_RECEIVED_NOK;
				}
			}
		}
	}
	return res;
}
*/
/*
XBEE_StatusTypeDef XbeeConfig(void)
{
	uint8_t commande[XBEE_FIELD_OR_VALUE_SIZE];
	//on commence par un factory Reset ATRE, c'est un peu violent mais bon...

	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_MODE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	HAL_Delay(10);
	//Factory Reset
	/*if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_FACTORY_RESET))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}*/
	//Fige la configuration
	/*if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_WRITE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}*/
/*	for (int i = 0 ; i < XBEE_FIELD_OR_VALUE_SIZE ; i=i+1)
	{
		if (strlen(xbeeDefaultConfig[i][XBEE_FIELD]) != 0 )
		{
			sprintf(commande, "AT%s%s\r", xbeeDefaultConfig[i][XBEE_FIELD], xbeeDefaultConfig[i][XBEE_VALUE]);
			if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(commande))
			{
				return XBEE_CMD_RECEIVED_NOK;
			}
		}
		HAL_Delay(10);
	}
	//fige la configuration
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_WRITE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	HAL_Delay(10);
	//sort du mode commande
	if ( XBEE_CMD_MODE_OK != XbeeSendCmdWaitOk(XBEE_CMD_EXIT_CMD_MODE))
	{
		return XBEE_CMD_RECEIVED_NOK;
	}
	else
		return XBEE_CMD_MODE_OK; //ciao bye
}

*/
