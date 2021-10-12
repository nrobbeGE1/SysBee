################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/hcs08/t_jslong/Sources/ExampleFuncs.c \
../Core/xbee/test/hcs08/t_jslong/Sources/main.c \
../Core/xbee/test/hcs08/t_jslong/Sources/serial.c \
../Core/xbee/test/hcs08/t_jslong/Sources/vector_table.c 

OBJS += \
./Core/xbee/test/hcs08/t_jslong/Sources/ExampleFuncs.o \
./Core/xbee/test/hcs08/t_jslong/Sources/main.o \
./Core/xbee/test/hcs08/t_jslong/Sources/serial.o \
./Core/xbee/test/hcs08/t_jslong/Sources/vector_table.o 

C_DEPS += \
./Core/xbee/test/hcs08/t_jslong/Sources/ExampleFuncs.d \
./Core/xbee/test/hcs08/t_jslong/Sources/main.d \
./Core/xbee/test/hcs08/t_jslong/Sources/serial.d \
./Core/xbee/test/hcs08/t_jslong/Sources/vector_table.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/hcs08/t_jslong/Sources/%.o: ../Core/xbee/test/hcs08/t_jslong/Sources/%.c Core/xbee/test/hcs08/t_jslong/Sources/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

