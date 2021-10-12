################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./xbee_src/zigbee/zcl_basic.o \
./xbee_src/zigbee/zcl_client.o \
./xbee_src/zigbee/zcl_commissioning.o \
./xbee_src/zigbee/zcl_identify.o \
./xbee_src/zigbee/zcl_onoff.o \
./xbee_src/zigbee/zcl_ota_server.o \
./xbee_src/zigbee/zcl_ota_upgrade.o \
./xbee_src/zigbee/zcl_time.o \
./xbee_src/zigbee/zcl_types.o \
./xbee_src/zigbee/zigbee_zcl.o \
./xbee_src/zigbee/zigbee_zdo.o 

C_DEPS += \
./xbee_src/zigbee/zcl_basic.d \
./xbee_src/zigbee/zcl_client.d \
./xbee_src/zigbee/zcl_commissioning.d \
./xbee_src/zigbee/zcl_identify.d \
./xbee_src/zigbee/zcl_onoff.d \
./xbee_src/zigbee/zcl_ota_server.d \
./xbee_src/zigbee/zcl_ota_upgrade.d \
./xbee_src/zigbee/zcl_time.d \
./xbee_src/zigbee/zcl_types.d \
./xbee_src/zigbee/zigbee_zcl.d \
./xbee_src/zigbee/zigbee_zdo.d 


# Each subdirectory must supply rules for building sources it contributes
xbee_src/zigbee/zcl_basic.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_basic.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_client.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_client.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_commissioning.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_commissioning.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_identify.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_identify.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_onoff.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_onoff.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_ota_server.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_ota_server.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_ota_upgrade.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_ota_upgrade.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_time.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_time.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zcl_types.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zcl_types.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zigbee_zcl.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zigbee_zcl.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/zigbee/zigbee_zdo.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/zigbee/zigbee_zdo.c xbee_src/zigbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

