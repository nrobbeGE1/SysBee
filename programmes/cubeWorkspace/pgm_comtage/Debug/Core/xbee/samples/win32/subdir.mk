################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/samples/win32/comports.c \
../Core/xbee/samples/win32/eblinfo.c \
../Core/xbee/samples/win32/install_ebin.c \
../Core/xbee/samples/win32/install_ebl.c \
../Core/xbee/samples/win32/parse_serial_args.c \
../Core/xbee/samples/win32/pxbee_ota_update.c \
../Core/xbee/samples/win32/pxbee_update.c \
../Core/xbee/samples/win32/win32_select_file.c \
../Core/xbee/samples/win32/xbee_term_win32.c 

OBJS += \
./Core/xbee/samples/win32/comports.o \
./Core/xbee/samples/win32/eblinfo.o \
./Core/xbee/samples/win32/install_ebin.o \
./Core/xbee/samples/win32/install_ebl.o \
./Core/xbee/samples/win32/parse_serial_args.o \
./Core/xbee/samples/win32/pxbee_ota_update.o \
./Core/xbee/samples/win32/pxbee_update.o \
./Core/xbee/samples/win32/win32_select_file.o \
./Core/xbee/samples/win32/xbee_term_win32.o 

C_DEPS += \
./Core/xbee/samples/win32/comports.d \
./Core/xbee/samples/win32/eblinfo.d \
./Core/xbee/samples/win32/install_ebin.d \
./Core/xbee/samples/win32/install_ebl.d \
./Core/xbee/samples/win32/parse_serial_args.d \
./Core/xbee/samples/win32/pxbee_ota_update.d \
./Core/xbee/samples/win32/pxbee_update.d \
./Core/xbee/samples/win32/win32_select_file.d \
./Core/xbee/samples/win32/xbee_term_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/samples/win32/%.o: ../Core/xbee/samples/win32/%.c Core/xbee/samples/win32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

