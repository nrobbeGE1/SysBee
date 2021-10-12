################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./xbee_src/mbedtls/aes.o \
./xbee_src/mbedtls/bignum.o \
./xbee_src/mbedtls/ctr_drbg.o \
./xbee_src/mbedtls/entropy.o \
./xbee_src/mbedtls/entropy_poll.o \
./xbee_src/mbedtls/mbedtls_util.o \
./xbee_src/mbedtls/sha256.o 

C_DEPS += \
./xbee_src/mbedtls/aes.d \
./xbee_src/mbedtls/bignum.d \
./xbee_src/mbedtls/ctr_drbg.d \
./xbee_src/mbedtls/entropy.d \
./xbee_src/mbedtls/entropy_poll.d \
./xbee_src/mbedtls/mbedtls_util.d \
./xbee_src/mbedtls/sha256.d 


# Each subdirectory must supply rules for building sources it contributes
xbee_src/mbedtls/aes.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/aes.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/bignum.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/bignum.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/ctr_drbg.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/ctr_drbg.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/entropy.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/entropy.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/entropy_poll.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/entropy_poll.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/mbedtls_util.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/mbedtls_util.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
xbee_src/mbedtls/sha256.o: C:/Users/antoine.serry/Desktop/Nouveau\ dossier/SysBee/programmes/cubeWorkspace/pgm_comtage/Core/xbee/src/mbedtls/sha256.c xbee_src/mbedtls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

