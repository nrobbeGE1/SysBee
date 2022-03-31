/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32l0xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
//#include "xbee_core.h"
#include "string.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */


extern UART_HandleTypeDef huart1;
extern UART_HandleTypeDef huart2;
extern DMA_HandleTypeDef hdma_usart1_rx;
extern DMA_HandleTypeDef hdma_usart1_tx;
extern int16_t traqueur;

extern uint8_t xbee_usart1_rx_flag; //se met à 1 dans la fonction callback : HAL_UARTEx_RxEventCallback
extern uint8_t xbee_usart1_rx_size; //nombre d'octets reçu sur l'USART1
extern uint8_t xbee_usart1_tx_flag; //se met à 1 dans la fonction callback : HAL_UARTEx_RxEventCallback

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define S3_Pin GPIO_PIN_13
#define S3_GPIO_Port GPIOC
#define S2_Pin GPIO_PIN_0
#define S2_GPIO_Port GPIOH
#define S0_Pin GPIO_PIN_1
#define S0_GPIO_Port GPIOH
#define S1_Pin GPIO_PIN_0
#define S1_GPIO_Port GPIOA
#define MUX1_Pin GPIO_PIN_1
#define MUX1_GPIO_Port GPIOA
#define UART_TX_Pin GPIO_PIN_2
#define UART_TX_GPIO_Port GPIOA
#define UART_RX_Pin GPIO_PIN_3
#define UART_RX_GPIO_Port GPIOA
#define MUX2_Pin GPIO_PIN_4
#define MUX2_GPIO_Port GPIOA
#define LED_EN_Pin GPIO_PIN_5
#define LED_EN_GPIO_Port GPIOA
#define LED_R_Pin GPIO_PIN_2
#define LED_R_GPIO_Port GPIOB
#define LED_V_Pin GPIO_PIN_10
#define LED_V_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
