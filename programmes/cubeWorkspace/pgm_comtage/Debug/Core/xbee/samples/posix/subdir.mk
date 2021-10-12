################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/samples/posix/eblinfo.c \
../Core/xbee/samples/posix/install_ebin.c \
../Core/xbee/samples/posix/install_ebl.c \
../Core/xbee/samples/posix/parse_serial_args.c \
../Core/xbee/samples/posix/xbee_term_posix.c 

OBJS += \
./Core/xbee/samples/posix/eblinfo.o \
./Core/xbee/samples/posix/install_ebin.o \
./Core/xbee/samples/posix/install_ebl.o \
./Core/xbee/samples/posix/parse_serial_args.o \
./Core/xbee/samples/posix/xbee_term_posix.o 

C_DEPS += \
./Core/xbee/samples/posix/eblinfo.d \
./Core/xbee/samples/posix/install_ebin.d \
./Core/xbee/samples/posix/install_ebl.d \
./Core/xbee/samples/posix/parse_serial_args.d \
./Core/xbee/samples/posix/xbee_term_posix.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/samples/posix/%.o: ../Core/xbee/samples/posix/%.c Core/xbee/samples/posix/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

