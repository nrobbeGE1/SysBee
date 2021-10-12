################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./xbee_src/wpan/wpan_aps.o \
./xbee_src/wpan/wpan_types.o 

C_DEPS += \
./xbee_src/wpan/wpan_aps.d \
./xbee_src/wpan/wpan_types.d 


# Each subdirectory must supply rules for building sources it contributes
xbee_src/wpan/wpan_aps.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/wpan/wpan_aps.c xbee_src/wpan/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/wpan/wpan_types.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/wpan/wpan_types.c xbee_src/wpan/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

