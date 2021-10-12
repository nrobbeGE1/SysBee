################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/zigbee/zcl_24bit.c \
../Core/xbee/test/zigbee/zcl_boolean.c \
../Core/xbee/test/zigbee/zcl_encode_structured_values.c \
../Core/xbee/test/zigbee/zcl_read.c \
../Core/xbee/test/zigbee/zcl_test_common.c \
../Core/xbee/test/zigbee/zcl_type_info.c \
../Core/xbee/test/zigbee/zcl_type_name.c \
../Core/xbee/test/zigbee/zcl_write.c \
../Core/xbee/test/zigbee/zdo_match_desc_request.c \
../Core/xbee/test/zigbee/zdo_simple_desc_respond.c \
../Core/xbee/test/zigbee/zdo_tool.c 

OBJS += \
./Core/xbee/test/zigbee/zcl_24bit.o \
./Core/xbee/test/zigbee/zcl_boolean.o \
./Core/xbee/test/zigbee/zcl_encode_structured_values.o \
./Core/xbee/test/zigbee/zcl_read.o \
./Core/xbee/test/zigbee/zcl_test_common.o \
./Core/xbee/test/zigbee/zcl_type_info.o \
./Core/xbee/test/zigbee/zcl_type_name.o \
./Core/xbee/test/zigbee/zcl_write.o \
./Core/xbee/test/zigbee/zdo_match_desc_request.o \
./Core/xbee/test/zigbee/zdo_simple_desc_respond.o \
./Core/xbee/test/zigbee/zdo_tool.o 

C_DEPS += \
./Core/xbee/test/zigbee/zcl_24bit.d \
./Core/xbee/test/zigbee/zcl_boolean.d \
./Core/xbee/test/zigbee/zcl_encode_structured_values.d \
./Core/xbee/test/zigbee/zcl_read.d \
./Core/xbee/test/zigbee/zcl_test_common.d \
./Core/xbee/test/zigbee/zcl_type_info.d \
./Core/xbee/test/zigbee/zcl_type_name.d \
./Core/xbee/test/zigbee/zcl_write.d \
./Core/xbee/test/zigbee/zdo_match_desc_request.d \
./Core/xbee/test/zigbee/zdo_simple_desc_respond.d \
./Core/xbee/test/zigbee/zdo_tool.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/zigbee/%.o: ../Core/xbee/test/zigbee/%.c Core/xbee/test/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

