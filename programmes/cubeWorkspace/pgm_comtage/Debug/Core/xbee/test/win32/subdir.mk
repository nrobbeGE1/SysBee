################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/win32/coverity.c \
../Core/xbee/test/win32/serial-passthru.c 

OBJS += \
./Core/xbee/test/win32/coverity.o \
./Core/xbee/test/win32/serial-passthru.o 

C_DEPS += \
./Core/xbee/test/win32/coverity.d \
./Core/xbee/test/win32/serial-passthru.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/win32/%.o: ../Core/xbee/test/win32/%.c Core/xbee/test/win32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

