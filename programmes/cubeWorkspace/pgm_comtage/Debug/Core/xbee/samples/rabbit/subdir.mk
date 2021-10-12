################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/samples/rabbit/AT\ interactive.c \
../Core/xbee/samples/rabbit/AT_remote.c \
../Core/xbee/samples/rabbit/Basic_XBee_Init.c \
../Core/xbee/samples/rabbit/Basic_XBee_Query.c \
../Core/xbee/samples/rabbit/SXA-command.c \
../Core/xbee/samples/rabbit/SXA-io.c \
../Core/xbee/samples/rabbit/SXA-socket.c \
../Core/xbee/samples/rabbit/SXA-stream.c \
../Core/xbee/samples/rabbit/serial_bypass.c \
../Core/xbee/samples/rabbit/transparent_client.c \
../Core/xbee/samples/rabbit/xbee_update_ebl.c \
../Core/xbee/samples/rabbit/xbee_update_oem.c 

OBJS += \
./Core/xbee/samples/rabbit/AT\ interactive.o \
./Core/xbee/samples/rabbit/AT_remote.o \
./Core/xbee/samples/rabbit/Basic_XBee_Init.o \
./Core/xbee/samples/rabbit/Basic_XBee_Query.o \
./Core/xbee/samples/rabbit/SXA-command.o \
./Core/xbee/samples/rabbit/SXA-io.o \
./Core/xbee/samples/rabbit/SXA-socket.o \
./Core/xbee/samples/rabbit/SXA-stream.o \
./Core/xbee/samples/rabbit/serial_bypass.o \
./Core/xbee/samples/rabbit/transparent_client.o \
./Core/xbee/samples/rabbit/xbee_update_ebl.o \
./Core/xbee/samples/rabbit/xbee_update_oem.o 

C_DEPS += \
./Core/xbee/samples/rabbit/AT\ interactive.d \
./Core/xbee/samples/rabbit/AT_remote.d \
./Core/xbee/samples/rabbit/Basic_XBee_Init.d \
./Core/xbee/samples/rabbit/Basic_XBee_Query.d \
./Core/xbee/samples/rabbit/SXA-command.d \
./Core/xbee/samples/rabbit/SXA-io.d \
./Core/xbee/samples/rabbit/SXA-socket.d \
./Core/xbee/samples/rabbit/SXA-stream.d \
./Core/xbee/samples/rabbit/serial_bypass.d \
./Core/xbee/samples/rabbit/transparent_client.d \
./Core/xbee/samples/rabbit/xbee_update_ebl.d \
./Core/xbee/samples/rabbit/xbee_update_oem.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/samples/rabbit/AT\ interactive.o: ../Core/xbee/samples/rabbit/AT\ interactive.c Core/xbee/samples/rabbit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/xbee/samples/rabbit/AT interactive.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/xbee/samples/rabbit/%.o: ../Core/xbee/samples/rabbit/%.c Core/xbee/samples/rabbit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

