################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./xbee_src/util/crc16buypass.o \
./xbee_src/util/hexdump.o \
./xbee_src/util/hexstrtobyte.o \
./xbee_src/util/jslong.o \
./xbee_src/util/memcheck.o \
./xbee_src/util/srp.o \
./xbee_src/util/swapbytes.o \
./xbee_src/util/swapcpy.o \
./xbee_src/util/xbee_random_mbedtls.o \
./xbee_src/util/xmodem_crc16.o 

C_DEPS += \
./xbee_src/util/crc16buypass.d \
./xbee_src/util/hexdump.d \
./xbee_src/util/hexstrtobyte.d \
./xbee_src/util/jslong.d \
./xbee_src/util/memcheck.d \
./xbee_src/util/srp.d \
./xbee_src/util/swapbytes.d \
./xbee_src/util/swapcpy.d \
./xbee_src/util/xbee_random_mbedtls.d \
./xbee_src/util/xmodem_crc16.d 


# Each subdirectory must supply rules for building sources it contributes
xbee_src/util/crc16buypass.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/crc16buypass.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/hexdump.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/hexdump.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/hexstrtobyte.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/hexstrtobyte.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/jslong.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/jslong.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/memcheck.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/memcheck.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/srp.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/srp.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/swapbytes.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/swapbytes.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/swapcpy.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/swapcpy.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/xbee_random_mbedtls.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/xbee_random_mbedtls.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/util/xmodem_crc16.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/util/xmodem_crc16.c xbee_src/util/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

