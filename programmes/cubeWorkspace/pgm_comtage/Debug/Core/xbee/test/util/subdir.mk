################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/util/crc_test.c \
../Core/xbee/test/util/jsll_gen.c \
../Core/xbee/test/util/t_jslong.c \
../Core/xbee/test/util/t_memcheck.c \
../Core/xbee/test/util/t_srp.c 

OBJS += \
./Core/xbee/test/util/crc_test.o \
./Core/xbee/test/util/jsll_gen.o \
./Core/xbee/test/util/t_jslong.o \
./Core/xbee/test/util/t_memcheck.o \
./Core/xbee/test/util/t_srp.o 

C_DEPS += \
./Core/xbee/test/util/crc_test.d \
./Core/xbee/test/util/jsll_gen.d \
./Core/xbee/test/util/t_jslong.d \
./Core/xbee/test/util/t_memcheck.d \
./Core/xbee/test/util/t_srp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/util/%.o: ../Core/xbee/test/util/%.c Core/xbee/test/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

