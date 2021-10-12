################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/ports/hcs08/xbee_platform_hcs08.c \
../Core/xbee/ports/hcs08/xbee_serial_hcs08.c 

OBJS += \
./Core/xbee/ports/hcs08/xbee_platform_hcs08.o \
./Core/xbee/ports/hcs08/xbee_serial_hcs08.o 

C_DEPS += \
./Core/xbee/ports/hcs08/xbee_platform_hcs08.d \
./Core/xbee/ports/hcs08/xbee_serial_hcs08.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/ports/hcs08/%.o: ../Core/xbee/ports/hcs08/%.c Core/xbee/ports/hcs08/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

