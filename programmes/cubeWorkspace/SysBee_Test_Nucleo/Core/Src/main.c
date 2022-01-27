/* USER CODE BEGIN Header */

//PGM TEST DEV BOARD

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

#define timeout_duration 200


/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart1;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

uint8_t lora_status;
uint8_t xbee_rx_last_byte;
uint8_t xbee_rx_buffer[256];
uint8_t xbee_rx_read_index = 0;
uint8_t xbee_rx_write_index = 0;

uint8_t test_string[100] = { 0x7E, 0x00, 0x0F, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xBA, 0xBA, 0x0D };

uint8_t config[20][2][10] = { 		//CONFIG INITIALE XBEE
	{"ID", "1111"}, // network id
	{"NI", "DEMOABC"}, // node id
	{"CE", "0"},	// coordinator mode
	{"AP", "1"},  	// API enable
	{"SP", "20"},	// cyclic sleep period
	{"SN", "100"},  // number of sleep periods
	{"SM", "0"},	// sleep mode
	{"ST", "500"}   // time before sleep
};
uint8_t config_step;

uint8_t config_length = 4;

enum xbee_send_states {		//AUTOMATE DE CONFIG INITIALE XBEE
	enter_command_mode,
	command_mode_ok,
	send_config,
	config_ok,
	single_command,
	single_command_ok,
	config_over
} xbee_send_state;

enum xbee_receive_states {
	idle,
	frame_length,
	frame_type,
	frame_id,
	frame_address64,
	frame_address16,
	frame_option,
	frame_at_status,
	frame_content,
	check_sum,
	process_content
} xbee_receive_state;

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

//AT COMMANDS https://cdn.sparkfun.com/assets/resources/2/9/22AT_Commands.pdf

struct frame received_frame;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
void check_coordinator();
void read_xbee();

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

  HAL_UART_Receive_IT(&huart1, &xbee_rx_last_byte, 1);

  while(xbee_send_state != config_over){	//TANT QUE LA CONFIG N'EST PAS FINIE
	  static uint16_t timeout;
	  char string[50] = {0};
	  switch(xbee_send_state){

		  case enter_command_mode:
			  HAL_UART_Transmit(&huart1, "+++", 3, 100);	//entrée en Command Mode
			  timeout = 0;
			  xbee_send_state = command_mode_ok;
		  break;

		  case command_mode_ok:
			  if(xbee_rx_buffer[xbee_rx_write_index-2] == 'O' && xbee_rx_buffer[xbee_rx_write_index-1] == 'K'){		//vérification que la réponse est "OK"
				  xbee_send_state = single_command;
			  	  timeout = 0;
			  }
			  else {
				  HAL_Delay(1);		//si on n'obtient pas de "OK", on attend en incrémentant la variable de timeout
				  timeout++;
				  if (timeout >= timeout_duration)
					  xbee_send_state = enter_command_mode;		//si on timeout, on recommence la config
			  }
		  break;

		  case single_command:
			  HAL_UART_Transmit(&huart1, "ATRE\r", 5, 100);		//remise à défaut de tous les paramètres
			  timeout = 0;
			  xbee_send_state = single_command_ok;
		  break;

		  case single_command_ok:
			  if(xbee_rx_buffer[xbee_rx_write_index-2] == 'O' && xbee_rx_buffer[xbee_rx_write_index-1] == 'K'){		//vérifcation que la réponse est "OK"
				  xbee_send_state = send_config;
				  timeout = 0;
			  }
			  else {
				  HAL_Delay(1); 	//si on n'obtient pas de "OK", on attend en incrémentant la variable de timeout
				  timeout++;
				  if (timeout >= timeout_duration)
					  xbee_send_state = enter_command_mode; 	//si on timeout, on recommence la config
			  }
		  break;

		  case send_config:
			  if(config_step == config_length){		//si config_step == 4 (4e étape de config) (config_step est incrémenté dans un autre état)
				  sprintf(string, "ATWR\r");		//on écrit "ATWR" (commande Write) dans le tableau string
			  }
			  else sprintf(string, "AT%s%s\r", config[config_step][0], config[config_step][1]); 	//sinon on écrit dans string la commande AT de la ligne config_step de config[] (ex: ligne 0 -> ATID1111)
			  if(config_step==config_length){	//si config_step = 4, alors config_step = 4? pas compris l'intérêt
				  config_step = 4;
			  }
			  HAL_UART_Transmit(&huart1, string, strlen(string), 100);		//envoie string (soit ATWR soit une autre commande de config) à la carte XBee
			  xbee_send_state = config_ok;
		  break;

		  case config_ok:
			  if(xbee_rx_buffer[xbee_rx_write_index-2] == 'O' && xbee_rx_buffer[xbee_rx_write_index-1] == 'K'){ 	//vérifcation que la réponse est "OK"
				  if(config_step == config_length)		//si config_step==4 alors config terminée -> pas d'écriture d'une partie du tableau de config...
					  xbee_send_state = config_over;	//confi finie, on sort du while()
				  timeout = 0;
				  config_step++;	//sinon on incrémente config_step (pour envoyer la ligne suivante du tableau config, jusqu'à arriver à 4)
				  xbee_send_state = send_config;	//on retourne à l'état send_config pour écrire dans string la nouvelle commande AT de config et l'envoyer
			  }
			  else {
				  HAL_Delay(1);		//si on n'obtient pas de "OK", on attend en incrémentant la variable de timeout
				  timeout++;
				  if (timeout >= timeout_duration)
					  xbee_send_state = enter_command_mode;		//si on timeout, on recommence la config
			  }
		  break;

		  default: break;
	  }
  }

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

		  switch (xbee_receive_state){
			  case idle:
				  if(xbee_rx_buffer[xbee_rx_read_index] == 0x7E) xbee_receive_state = frame_length;
				  /*else if (lora_requested && xbee_rx_buffer[xbee_rx_read_index] == 0xAA){
					  is_coordinator = True;
					  lora_requested = False;
				  }*/
			  break;

			  case frame_length:
				  received_frame.length += ((uint16_t)(xbee_rx_buffer[xbee_rx_read_index])) << (8-8*multiple_byte_step) ;
				  if(multiple_byte_step){
					  multiple_byte_step = 0;
					  xbee_receive_state = frame_type;
				  }
				  else{
					  multiple_byte_step++;
				  }
			  break;

			  case frame_type:
				  received_frame.type = xbee_rx_buffer[xbee_rx_read_index];
				  switch(received_frame.type){
				  	  case receive_packet: xbee_receive_state = frame_address64; break;
				  	  case remote_command_response: xbee_receive_state = frame_id; break;
				  	  default: xbee_rx_read_index = xbee_rx_write_index;
				  	  	  	   xbee_receive_state = idle;
				  	  break;
				  }

				  multiple_byte_step = 0;
			  break;

			  case frame_id:
				  received_frame.id = xbee_rx_buffer[xbee_rx_read_index];
				  xbee_receive_state = frame_address64;
			  break;

			  case frame_address64:
				  received_frame.address64 += ((uint64_t)xbee_rx_buffer[xbee_rx_read_index]) << (56-8*multiple_byte_step);

				  if(multiple_byte_step == 7){
					  xbee_receive_state = frame_address16;
					  multiple_byte_step = 0;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_address16:
				  received_frame.address16 += ((uint16_t)xbee_rx_buffer[xbee_rx_read_index]) << (8-8*multiple_byte_step);
				  if(multiple_byte_step == 1){
					  switch(received_frame.type){
					  	  case receive_packet: xbee_receive_state = frame_option; break;
					  	  case remote_command_response: xbee_receive_state = frame_at_status; break;
					  	  default: xbee_rx_read_index = xbee_rx_write_index;
							       xbee_receive_state = idle;
						  break;
					  }

					  multiple_byte_step = 0;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_option:
				  received_frame.option = xbee_rx_buffer[xbee_rx_read_index];
				  xbee_receive_state = frame_content;
			  break;

			  case frame_at_status:
				  received_frame.command_status[multiple_byte_step] = xbee_rx_buffer[xbee_rx_read_index];
				  if(multiple_byte_step == 2){
					  multiple_byte_step = 0;
					  xbee_receive_state = frame_content;
				  }
				  else multiple_byte_step++;
			  break;

			  case frame_content:
				  received_frame.content[received_frame.content_index] = xbee_rx_buffer[xbee_rx_read_index];
				  if(((received_frame.content_index == received_frame.length-13) && received_frame.type==receive_packet) || ((received_frame.content_index == received_frame.length-16) && (received_frame.type==remote_command_response)))
					  xbee_receive_state = check_sum;
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
				  xbee_receive_state = idle;
			  break;

			  case process_content:
				  0;
			  break;
		  }

		  xbee_rx_read_index += 1;

	  }

	  read_xbee();
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

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if (huart->Instance == USART1){
	    xbee_rx_buffer[xbee_rx_write_index] = xbee_rx_last_byte;
	    xbee_rx_write_index++;
	    HAL_UART_Receive_IT(&huart1, &xbee_rx_last_byte, 1);
	}

}

void read_xbee(){

  if(xbee_rx_read_index<xbee_rx_write_index){
	  uint64_t sum = 0;
	  static uint8_t multiple_byte_step;

	  switch (xbee_receive_state){
		  case idle:
			  if(xbee_rx_buffer[xbee_rx_read_index] == 0x7E) xbee_receive_state = frame_length;
			  /*else if (lora_requested && xbee_rx_buffer[xbee_rx_read_index] == 0xAA){
				  is_coordinator = True;
				  lora_requested = False;
			  }*/
		  break;

		  case frame_length:
			  received_frame.length += ((uint16_t)(xbee_rx_buffer[xbee_rx_read_index])) << (8-8*multiple_byte_step) ;
			  if(multiple_byte_step){
				  multiple_byte_step = 0;
				  xbee_receive_state = frame_type;
			  }
			  else{
				  multiple_byte_step++;
			  }
		  break;

		  case frame_type:
			  received_frame.type = xbee_rx_buffer[xbee_rx_read_index];
			  switch(received_frame.type){
				  case receive_packet: xbee_receive_state = frame_address64; break;
				  case remote_command_response: xbee_receive_state = frame_id; break;
				  default: xbee_rx_read_index = xbee_rx_write_index;
						   xbee_receive_state = idle;
				  break;
			  }

			  multiple_byte_step = 0;
		  break;

		  case frame_id:
			  received_frame.id = xbee_rx_buffer[xbee_rx_read_index];
			  xbee_receive_state = frame_address64;
		  break;

		  case frame_address64:
			  received_frame.address64 += ((uint64_t)xbee_rx_buffer[xbee_rx_read_index]) << (56-8*multiple_byte_step);

			  if(multiple_byte_step == 7){
				  xbee_receive_state = frame_address16;
				  multiple_byte_step = 0;
			  }
			  else multiple_byte_step++;
		  break;

		  case frame_address16:
			  received_frame.address16 += ((uint16_t)xbee_rx_buffer[xbee_rx_read_index]) << (8-8*multiple_byte_step);
			  if(multiple_byte_step == 1){
				  switch(received_frame.type){
					  case receive_packet: xbee_receive_state = frame_option; break;
					  case remote_command_response: xbee_receive_state = frame_at_status; break;
					  default: xbee_rx_read_index = xbee_rx_write_index;
							   xbee_receive_state = idle;
					  break;
				  }

				  multiple_byte_step = 0;
			  }
			  else multiple_byte_step++;
		  break;

		  case frame_option:
			  received_frame.option = xbee_rx_buffer[xbee_rx_read_index];
			  xbee_receive_state = frame_content;
		  break;

		  case frame_at_status:
			  received_frame.command_status[multiple_byte_step] = xbee_rx_buffer[xbee_rx_read_index];
			  if(multiple_byte_step == 2){
				  multiple_byte_step = 0;
				  xbee_receive_state = frame_content;
			  }
			  else multiple_byte_step++;
		  break;

		  case frame_content:
			  received_frame.content[received_frame.content_index] = xbee_rx_buffer[xbee_rx_read_index];
			  if(((received_frame.content_index == received_frame.length-13) && received_frame.type==receive_packet) || ((received_frame.content_index == received_frame.length-16) && (received_frame.type==remote_command_response)))
				  xbee_receive_state = check_sum;
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
			  xbee_receive_state = idle;
		  break;

		  case process_content:
			  0;
		  break;
	  }

	  xbee_rx_read_index += 1;

  }
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
