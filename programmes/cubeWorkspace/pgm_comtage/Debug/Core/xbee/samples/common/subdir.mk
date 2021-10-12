################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/xbee/samples/common/_atinter.c \
../Core/xbee/samples/common/_commission_client.c \
../Core/xbee/samples/common/_commission_server.c \
../Core/xbee/samples/common/_nodetable.c \
../Core/xbee/samples/common/_pxbee_ota_update.c \
../Core/xbee/samples/common/_sxa_select.c \
../Core/xbee/samples/common/_xbee_term.c \
../Core/xbee/samples/common/_zigbee_walker.c \
../Core/xbee/samples/common/apply_profile.c \
../Core/xbee/samples/common/atinter.c \
../Core/xbee/samples/common/commissioning_client.c \
../Core/xbee/samples/common/commissioning_server.c \
../Core/xbee/samples/common/gpm.c \
../Core/xbee/samples/common/ipv4_client.c \
../Core/xbee/samples/common/network_scan.c \
../Core/xbee/samples/common/remote_at.c \
../Core/xbee/samples/common/sample_cli.c \
../Core/xbee/samples/common/sms_client.c \
../Core/xbee/samples/common/socket_test.c \
../Core/xbee/samples/common/transparent_client.c \
../Core/xbee/samples/common/user_data_relay.c \
../Core/xbee/samples/common/xbee3_ota_tool.c \
../Core/xbee/samples/common/xbee3_secure_session.c \
../Core/xbee/samples/common/xbee3_srp_verifier.c \
../Core/xbee/samples/common/xbee_ftp.c \
../Core/xbee/samples/common/xbee_netcat.c \
../Core/xbee/samples/common/xbee_term.c \
../Core/xbee/samples/common/zcltime.c \
../Core/xbee/samples/common/zigbee_ota_info.c \
../Core/xbee/samples/common/zigbee_register_device.c \
../Core/xbee/samples/common/zigbee_walker.c 

OBJS += \
./Core/xbee/samples/common/_atinter.o \
./Core/xbee/samples/common/_commission_client.o \
./Core/xbee/samples/common/_commission_server.o \
./Core/xbee/samples/common/_nodetable.o \
./Core/xbee/samples/common/_pxbee_ota_update.o \
./Core/xbee/samples/common/_sxa_select.o \
./Core/xbee/samples/common/_xbee_term.o \
./Core/xbee/samples/common/_zigbee_walker.o \
./Core/xbee/samples/common/apply_profile.o \
./Core/xbee/samples/common/atinter.o \
./Core/xbee/samples/common/commissioning_client.o \
./Core/xbee/samples/common/commissioning_server.o \
./Core/xbee/samples/common/gpm.o \
./Core/xbee/samples/common/ipv4_client.o \
./Core/xbee/samples/common/network_scan.o \
./Core/xbee/samples/common/remote_at.o \
./Core/xbee/samples/common/sample_cli.o \
./Core/xbee/samples/common/sms_client.o \
./Core/xbee/samples/common/socket_test.o \
./Core/xbee/samples/common/transparent_client.o \
./Core/xbee/samples/common/user_data_relay.o \
./Core/xbee/samples/common/xbee3_ota_tool.o \
./Core/xbee/samples/common/xbee3_secure_session.o \
./Core/xbee/samples/common/xbee3_srp_verifier.o \
./Core/xbee/samples/common/xbee_ftp.o \
./Core/xbee/samples/common/xbee_netcat.o \
./Core/xbee/samples/common/xbee_term.o \
./Core/xbee/samples/common/zcltime.o \
./Core/xbee/samples/common/zigbee_ota_info.o \
./Core/xbee/samples/common/zigbee_register_device.o \
./Core/xbee/samples/common/zigbee_walker.o 

C_DEPS += \
./Core/xbee/samples/common/_atinter.d \
./Core/xbee/samples/common/_commission_client.d \
./Core/xbee/samples/common/_commission_server.d \
./Core/xbee/samples/common/_nodetable.d \
./Core/xbee/samples/common/_pxbee_ota_update.d \
./Core/xbee/samples/common/_sxa_select.d \
./Core/xbee/samples/common/_xbee_term.d \
./Core/xbee/samples/common/_zigbee_walker.d \
./Core/xbee/samples/common/apply_profile.d \
./Core/xbee/samples/common/atinter.d \
./Core/xbee/samples/common/commissioning_client.d \
./Core/xbee/samples/common/commissioning_server.d \
./Core/xbee/samples/common/gpm.d \
./Core/xbee/samples/common/ipv4_client.d \
./Core/xbee/samples/common/network_scan.d \
./Core/xbee/samples/common/remote_at.d \
./Core/xbee/samples/common/sample_cli.d \
./Core/xbee/samples/common/sms_client.d \
./Core/xbee/samples/common/socket_test.d \
./Core/xbee/samples/common/transparent_client.d \
./Core/xbee/samples/common/user_data_relay.d \
./Core/xbee/samples/common/xbee3_ota_tool.d \
./Core/xbee/samples/common/xbee3_secure_session.d \
./Core/xbee/samples/common/xbee3_srp_verifier.d \
./Core/xbee/samples/common/xbee_ftp.d \
./Core/xbee/samples/common/xbee_netcat.d \
./Core/xbee/samples/common/xbee_term.d \
./Core/xbee/samples/common/zcltime.d \
./Core/xbee/samples/common/zigbee_ota_info.d \
./Core/xbee/samples/common/zigbee_register_device.d \
./Core/xbee/samples/common/zigbee_walker.d 


# Each subdirectory must supply rules for building sources it contributes
Core/xbee/samples/common/%.o: ../Core/xbee/samples/common/%.c Core/xbee/samples/common/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I"../Core/xbee/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

