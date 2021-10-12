################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/test/hcs08/Shared/flash32KB.c \
../Core/xbee/test/hcs08/Shared/flash_cfgblk.c \
../Core/xbee/test/hcs08/Shared/rtc.c \
../Core/xbee/test/hcs08/Shared/sharedRAM.c \
../Core/xbee/test/hcs08/Shared/spi.c \
../Core/xbee/test/hcs08/Shared/stdio_SCI1.c \
../Core/xbee/test/hcs08/Shared/stdio_SCI1_int.c \
../Core/xbee/test/hcs08/Shared/stdio_null.c 

OBJS += \
./Core/xbee/test/hcs08/Shared/flash32KB.o \
./Core/xbee/test/hcs08/Shared/flash_cfgblk.o \
./Core/xbee/test/hcs08/Shared/rtc.o \
./Core/xbee/test/hcs08/Shared/sharedRAM.o \
./Core/xbee/test/hcs08/Shared/spi.o \
./Core/xbee/test/hcs08/Shared/stdio_SCI1.o \
./Core/xbee/test/hcs08/Shared/stdio_SCI1_int.o \
./Core/xbee/test/hcs08/Shared/stdio_null.o 

C_DEPS += \
./Core/xbee/test/hcs08/Shared/flash32KB.d \
./Core/xbee/test/hcs08/Shared/flash_cfgblk.d \
./Core/xbee/test/hcs08/Shared/rtc.d \
./Core/xbee/test/hcs08/Shared/sharedRAM.d \
./Core/xbee/test/hcs08/Shared/spi.d \
./Core/xbee/test/hcs08/Shared/stdio_SCI1.d \
./Core/xbee/test/hcs08/Shared/stdio_SCI1_int.d \
./Core/xbee/test/hcs08/Shared/stdio_null.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/test/hcs08/Shared/%.o: ../Core/xbee/test/hcs08/Shared/%.c Core/xbee/test/hcs08/Shared/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

