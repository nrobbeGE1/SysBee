################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./xbee_src/xbee/pxbee_ota_client.o \
./xbee_src/xbee/pxbee_ota_server.o \
./xbee_src/xbee/xbee_atcmd.o \
./xbee_src/xbee/xbee_atmode.o \
./xbee_src/xbee/xbee_bl_gen3.o \
./xbee_src/xbee/xbee_cbuf.o \
./xbee_src/xbee/xbee_commissioning.o \
./xbee_src/xbee/xbee_delivery_status.o \
./xbee_src/xbee/xbee_device.o \
./xbee_src/xbee/xbee_discovery.o \
./xbee_src/xbee/xbee_ebl_file.o \
./xbee_src/xbee/xbee_ext_modem_status.o \
./xbee_src/xbee/xbee_file_system.o \
./xbee_src/xbee/xbee_firmware.o \
./xbee_src/xbee/xbee_gpm.o \
./xbee_src/xbee/xbee_io.o \
./xbee_src/xbee/xbee_ipv4.o \
./xbee_src/xbee/xbee_reg_descr.o \
./xbee_src/xbee/xbee_register_device.o \
./xbee_src/xbee/xbee_route.o \
./xbee_src/xbee/xbee_scan.o \
./xbee_src/xbee/xbee_secure_session.o \
./xbee_src/xbee/xbee_sms.o \
./xbee_src/xbee/xbee_socket.o \
./xbee_src/xbee/xbee_socket_frames.o \
./xbee_src/xbee/xbee_sxa.o \
./xbee_src/xbee/xbee_time.o \
./xbee_src/xbee/xbee_transparent_serial.o \
./xbee_src/xbee/xbee_tx_status.o \
./xbee_src/xbee/xbee_user_data.o \
./xbee_src/xbee/xbee_wifi.o \
./xbee_src/xbee/xbee_wpan.o \
./xbee_src/xbee/xbee_xmodem.o 

C_DEPS += \
./xbee_src/xbee/pxbee_ota_client.d \
./xbee_src/xbee/pxbee_ota_server.d \
./xbee_src/xbee/xbee_atcmd.d \
./xbee_src/xbee/xbee_atmode.d \
./xbee_src/xbee/xbee_bl_gen3.d \
./xbee_src/xbee/xbee_cbuf.d \
./xbee_src/xbee/xbee_commissioning.d \
./xbee_src/xbee/xbee_delivery_status.d \
./xbee_src/xbee/xbee_device.d \
./xbee_src/xbee/xbee_discovery.d \
./xbee_src/xbee/xbee_ebl_file.d \
./xbee_src/xbee/xbee_ext_modem_status.d \
./xbee_src/xbee/xbee_file_system.d \
./xbee_src/xbee/xbee_firmware.d \
./xbee_src/xbee/xbee_gpm.d \
./xbee_src/xbee/xbee_io.d \
./xbee_src/xbee/xbee_ipv4.d \
./xbee_src/xbee/xbee_reg_descr.d \
./xbee_src/xbee/xbee_register_device.d \
./xbee_src/xbee/xbee_route.d \
./xbee_src/xbee/xbee_scan.d \
./xbee_src/xbee/xbee_secure_session.d \
./xbee_src/xbee/xbee_sms.d \
./xbee_src/xbee/xbee_socket.d \
./xbee_src/xbee/xbee_socket_frames.d \
./xbee_src/xbee/xbee_sxa.d \
./xbee_src/xbee/xbee_time.d \
./xbee_src/xbee/xbee_transparent_serial.d \
./xbee_src/xbee/xbee_tx_status.d \
./xbee_src/xbee/xbee_user_data.d \
./xbee_src/xbee/xbee_wifi.d \
./xbee_src/xbee/xbee_wpan.d \
./xbee_src/xbee/xbee_xmodem.d 


# Each subdirectory must supply rules for building sources it contributes
xbee_src/xbee/pxbee_ota_client.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/pxbee_ota_client.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/pxbee_ota_server.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/pxbee_ota_server.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_atcmd.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_atcmd.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_atmode.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_atmode.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_bl_gen3.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_bl_gen3.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_cbuf.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_cbuf.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_commissioning.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_commissioning.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_delivery_status.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_delivery_status.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_device.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_device.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_discovery.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_discovery.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_ebl_file.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_ebl_file.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_ext_modem_status.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_ext_modem_status.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_file_system.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_file_system.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_firmware.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_firmware.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_gpm.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_gpm.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_io.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_io.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_ipv4.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_ipv4.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_reg_descr.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_reg_descr.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_register_device.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_register_device.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_route.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_route.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_scan.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_scan.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_secure_session.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_secure_session.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_sms.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_sms.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_socket.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_socket.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_socket_frames.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_socket_frames.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_sxa.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_sxa.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_time.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_time.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_transparent_serial.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_transparent_serial.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_tx_status.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_tx_status.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_user_data.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_user_data.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_wifi.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_wifi.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_wpan.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_wpan.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/xbee/xbee_xmodem.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/xbee/xbee_xmodem.c xbee_src/xbee/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

