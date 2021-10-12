################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/src/mbedtls/aes.c \
../Core/xbee/src/mbedtls/bignum.c \
../Core/xbee/src/mbedtls/ctr_drbg.c \
../Core/xbee/src/mbedtls/entropy.c \
../Core/xbee/src/mbedtls/entropy_poll.c \
../Core/xbee/src/mbedtls/mbedtls_util.c \
../Core/xbee/src/mbedtls/sha256.c 

OBJS += \
./Core/xbee/src/mbedtls/aes.o \
./Core/xbee/src/mbedtls/bignum.o \
./Core/xbee/src/mbedtls/ctr_drbg.o \
./Core/xbee/src/mbedtls/entropy.o \
./Core/xbee/src/mbedtls/entropy_poll.o \
./Core/xbee/src/mbedtls/mbedtls_util.o \
./Core/xbee/src/mbedtls/sha256.o 

C_DEPS += \
./Core/xbee/src/mbedtls/aes.d \
./Core/xbee/src/mbedtls/bignum.d \
./Core/xbee/src/mbedtls/ctr_drbg.d \
./Core/xbee/src/mbedtls/entropy.d \
./Core/xbee/src/mbedtls/entropy_poll.d \
./Core/xbee/src/mbedtls/mbedtls_util.d \
./Core/xbee/src/mbedtls/sha256.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/src/mbedtls/%.o: ../Core/xbee/src/mbedtls/%.c Core/xbee/src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

