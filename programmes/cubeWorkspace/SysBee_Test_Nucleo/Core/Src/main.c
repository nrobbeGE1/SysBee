/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

#define transmit_request 0x10
#define receive_packet 0x90
#define remote_command_response 0x97
#define remote_AT_command_request 0x17


/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart1;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

uint8_t lora_status;

uint8_t xbee_rx_buffer[256] = {0x7E, 0x00, 0x16, 0x97, 0x01, 0xAF, 0xAF, 0xAF, 0xAF, 0xAF, 0xAF, 0xAF, 0xAF, 0xFF, 0xFE, 0x41, 0x41, 0x00, 0x42, 0x42, 0x20, 0x54, 0x45, 0x53, 0x54, 0x8C};
uint8_t xbee_rx_read_index = 0;
uint8_t xbee_rx_write_index = 100;

uint8_t test_string[100] = { 0x7E, 0x00, 0x0F, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xBA, 0xBA, 0x0D };

enum states {idle, frame_length, frame_type, frame_id, frame_address64, frame_address16, frame_option, frame_at_status, frame_content, check_sum, process_content} state;

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

struct frame received_frame;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

void check_coordinator();

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	  if(xbee_rx_read_index<xbee_rx_write_index){
		  uint64_t sum = 0;
		  static uint8_t multiple_byte_step;

		  switch (state){
			  case idle:
				  if(xbee_rx_buffer[xbee_rx_read_index] == 0x7E) state = frame_length;
				  /*else if (lora_requested && xbee_rx_buffer[xbee_rx_read_index] == 0xAA){
					  is_coordinator = True;
					  lora_requested = False;
				  }*/
			  break;

			  case frame_length:
				  received_frame.length += ((uint16_t)(xbee_rx_buffer[xbee_rx_read_index])) << (8-8*multiple_byte_step) ;
				  if(multiple_byte_step){
					  multiple_byte_step = 0;
					  state = frame_type;
				  }
				  else{
					  multiple_byte_step++;
				  }
			  break;

			  case frame_type:
				  received_frame.type = xbee_rx_buffer[xbee_rx_read_index];
				  switch(received_frame.type){
				  	  case receive_packet: state = frame_address64; break;
				  	  case remote_command_response: state = frame_id; break;
				  	  default: xbee_rx_read_index = xbee_rx_write_index;
				  	  	  	   state = idle;
				  	  break;
				  }

				  multiple_byte_step = 0;
			  break;

			  case frame_id:
				  received_frame.id = xbee_rx_buffer[xbee_rx_read_index];
				  state = frame_address64;
			  break;

			  case frame_address64:
				  received_frame.address64 += ((uint64_t)xbee_rx_buffer[xbee_rx_read_index]) << (56-8*multiple_byte_step);

				  if(multiple_byte_step == 7){
					  state = frame_address16;
					  multiple_byte_step = 0;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_address16:
				  received_frame.address16 += ((uint16_t)xbee_rx_buffer[xbee_rx_read_index]) << (8-8*multiple_byte_step);
				  if(multiple_byte_step == 1){
					  switch(received_frame.type){
					  	  case receive_packet: state = frame_option; break;
					  	  case remote_command_response: state = frame_at_status; break;
					  	  default: xbee_rx_read_index = xbee_rx_write_index;
							       state = idle;
						  break;
					  }

					  multiple_byte_step = 0;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_option:
				  received_frame.option = xbee_rx_buffer[xbee_rx_read_index];
				  state = frame_content;
			  break;

			  case frame_at_status:
				  received_frame.command_status[multiple_byte_step] = xbee_rx_buffer[xbee_rx_read_index];
				  if(multiple_byte_step == 2){
					  multiple_byte_step = 0;
					  state = frame_content;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_content:
				  received_frame.content[received_frame.content_index] = xbee_rx_buffer[xbee_rx_read_index];
				  if(((received_frame.content_index == received_frame.length-13) && received_frame.type==receive_packet) || ((received_frame.content_index == received_frame.length-16) && (received_frame.type==remote_command_response)))
					  state = check_sum;
				  else
					  received_frame.content_index++;
			  break;

			  case check_sum:
				  received_frame.check_sum = xbee_rx_buffer[xbee_rx_read_index];
				  for(uint8_t i=0; i<8; i++) sum += (((uint64_t)0xFF<<(56-8*i)) & received_frame.address64)>>(56-8*i);
				  for(uint8_t i=0; i<2; i++) sum += (((uint16_t)0xFF<<(8-8*i)) & received_frame.address16)>>(8-i*8);
				  if(received_frame.id==receive_packet) for(uint16_t i=0; i<received_frame.length-12; i++) sum += received_frame.content[i];
				  else if(received_frame.type==remote_command_response){
					  for(uint16_t i=0; i<received_frame.length-15; i++) sum += received_frame.content[i];
					  for(uint8_t i=0; i<4; i++) sum += received_frame.command_status[i];
				  }
				  sum += received_frame.type + received_frame.option + received_frame.id + received_frame.check_sum;
				  received_frame.check_sum_ok = (sum & 0xFF) == 0xFF;
				  state = idle;
			  break;

			  case process_content:
				  0;
			  break;
		  }

		  xbee_rx_read_index += 1;

	  }
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLLMUL_4;
  RCC_OscInitStruct.PLL.PLLDIV = RCC_PLLDIV_2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  PeriphClkInit.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 9600;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : LD2_Pin */
  GPIO_InitStruct.Pin = LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

void check_coordinator(){

}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
