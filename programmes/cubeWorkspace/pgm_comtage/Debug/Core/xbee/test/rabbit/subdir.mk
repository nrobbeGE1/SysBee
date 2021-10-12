################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/rabbit/new\ xbee\ param.c \
../Core/xbee/test/rabbit/test_xbee_device.c \
../Core/xbee/test/rabbit/test_xbee_param.c \
../Core/xbee/test/rabbit/unittest_xbee_device.c \
../Core/xbee/test/rabbit/unittest_xbee_serial.c 

OBJS += \
./Core/xbee/test/rabbit/new\ xbee\ param.o \
./Core/xbee/test/rabbit/test_xbee_device.o \
./Core/xbee/test/rabbit/test_xbee_param.o \
./Core/xbee/test/rabbit/unittest_xbee_device.o \
./Core/xbee/test/rabbit/unittest_xbee_serial.o 

C_DEPS += \
./Core/xbee/test/rabbit/new\ xbee\ param.d \
./Core/xbee/test/rabbit/test_xbee_device.d \
./Core/xbee/test/rabbit/test_xbee_param.d \
./Core/xbee/test/rabbit/unittest_xbee_device.d \
./Core/xbee/test/rabbit/unittest_xbee_serial.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/rabbit/new\ xbee\ param.o: ../Core/xbee/test/rabbit/new\ xbee\ param.c Core/xbee/test/rabbit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/xbee/test/rabbit/new xbee param.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/xbee/test/rabbit/%.o: ../Core/xbee/test/rabbit/%.c Core/xbee/test/rabbit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

