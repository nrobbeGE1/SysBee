################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/src/util/crc16buypass.c \
../Core/xbee/src/util/hexdump.c \
../Core/xbee/src/util/hexstrtobyte.c \
../Core/xbee/src/util/jslong.c \
../Core/xbee/src/util/memcheck.c \
../Core/xbee/src/util/srp.c \
../Core/xbee/src/util/swapbytes.c \
../Core/xbee/src/util/swapcpy.c \
../Core/xbee/src/util/xbee_random_mbedtls.c \
../Core/xbee/src/util/xmodem_crc16.c 

OBJS += \
./Core/xbee/src/util/crc16buypass.o \
./Core/xbee/src/util/hexdump.o \
./Core/xbee/src/util/hexstrtobyte.o \
./Core/xbee/src/util/jslong.o \
./Core/xbee/src/util/memcheck.o \
./Core/xbee/src/util/srp.o \
./Core/xbee/src/util/swapbytes.o \
./Core/xbee/src/util/swapcpy.o \
./Core/xbee/src/util/xbee_random_mbedtls.o \
./Core/xbee/src/util/xmodem_crc16.o 

C_DEPS += \
./Core/xbee/src/util/crc16buypass.d \
./Core/xbee/src/util/hexdump.d \
./Core/xbee/src/util/hexstrtobyte.d \
./Core/xbee/src/util/jslong.d \
./Core/xbee/src/util/memcheck.d \
./Core/xbee/src/util/srp.d \
./Core/xbee/src/util/swapbytes.d \
./Core/xbee/src/util/swapcpy.d \
./Core/xbee/src/util/xbee_random_mbedtls.d \
./Core/xbee/src/util/xmodem_crc16.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/src/util/%.o: ../Core/xbee/src/util/%.c Core/xbee/src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

