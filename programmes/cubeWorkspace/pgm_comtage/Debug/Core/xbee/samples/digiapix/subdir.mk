################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/samples/digiapix/eblinfo.c \
../Core/xbee/samples/digiapix/install_ebin.c \
../Core/xbee/samples/digiapix/install_ebl.c \
../Core/xbee/samples/digiapix/parse_serial_args.c \
../Core/xbee/samples/digiapix/xbee_term_digiapix.c 

OBJS += \
./Core/xbee/samples/digiapix/eblinfo.o \
./Core/xbee/samples/digiapix/install_ebin.o \
./Core/xbee/samples/digiapix/install_ebl.o \
./Core/xbee/samples/digiapix/parse_serial_args.o \
./Core/xbee/samples/digiapix/xbee_term_digiapix.o 

C_DEPS += \
./Core/xbee/samples/digiapix/eblinfo.d \
./Core/xbee/samples/digiapix/install_ebin.d \
./Core/xbee/samples/digiapix/install_ebl.d \
./Core/xbee/samples/digiapix/parse_serial_args.d \
./Core/xbee/samples/digiapix/xbee_term_digiapix.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/samples/digiapix/%.o: ../Core/xbee/samples/digiapix/%.c Core/xbee/samples/digiapix/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

