################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/src/zigbee/zcl_basic.c \
../Core/xbee/src/zigbee/zcl_client.c \
../Core/xbee/src/zigbee/zcl_commissioning.c \
../Core/xbee/src/zigbee/zcl_identify.c \
../Core/xbee/src/zigbee/zcl_onoff.c \
../Core/xbee/src/zigbee/zcl_ota_server.c \
../Core/xbee/src/zigbee/zcl_ota_upgrade.c \
../Core/xbee/src/zigbee/zcl_time.c \
../Core/xbee/src/zigbee/zcl_types.c \
../Core/xbee/src/zigbee/zigbee_zcl.c \
../Core/xbee/src/zigbee/zigbee_zdo.c 

OBJS += \
./Core/xbee/src/zigbee/zcl_basic.o \
./Core/xbee/src/zigbee/zcl_client.o \
./Core/xbee/src/zigbee/zcl_commissioning.o \
./Core/xbee/src/zigbee/zcl_identify.o \
./Core/xbee/src/zigbee/zcl_onoff.o \
./Core/xbee/src/zigbee/zcl_ota_server.o \
./Core/xbee/src/zigbee/zcl_ota_upgrade.o \
./Core/xbee/src/zigbee/zcl_time.o \
./Core/xbee/src/zigbee/zcl_types.o \
./Core/xbee/src/zigbee/zigbee_zcl.o \
./Core/xbee/src/zigbee/zigbee_zdo.o 

C_DEPS += \
./Core/xbee/src/zigbee/zcl_basic.d \
./Core/xbee/src/zigbee/zcl_client.d \
./Core/xbee/src/zigbee/zcl_commissioning.d \
./Core/xbee/src/zigbee/zcl_identify.d \
./Core/xbee/src/zigbee/zcl_onoff.d \
./Core/xbee/src/zigbee/zcl_ota_server.d \
./Core/xbee/src/zigbee/zcl_ota_upgrade.d \
./Core/xbee/src/zigbee/zcl_time.d \
./Core/xbee/src/zigbee/zcl_types.d \
./Core/xbee/src/zigbee/zigbee_zcl.d \
./Core/xbee/src/zigbee/zigbee_zdo.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/src/zigbee/%.o: ../Core/xbee/src/zigbee/%.c Core/xbee/src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

