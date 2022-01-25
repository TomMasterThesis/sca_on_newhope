################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Src/new_hope/asm_KeccakF-1600.s \
../Core/Src/new_hope/asm_chacha.s \
../Core/Src/new_hope/asm_ec.s \
../Core/Src/new_hope/asm_ntt.s \
../Core/Src/new_hope/asm_poly.s 

C_SRCS += \
../Core/Src/new_hope/crypto_stream_chacha20.c \
../Core/Src/new_hope/error_correction.c \
../Core/Src/new_hope/fips202.c \
../Core/Src/new_hope/newhope.c \
../Core/Src/new_hope/ntt.c \
../Core/Src/new_hope/poly.c \
../Core/Src/new_hope/print.c \
../Core/Src/new_hope/randombytes.c \
../Core/Src/new_hope/reduce.c \
../Core/Src/new_hope/server.c \
../Core/Src/new_hope/stm32f0_wrapper.c 

OBJS += \
./Core/Src/new_hope/asm_KeccakF-1600.o \
./Core/Src/new_hope/asm_chacha.o \
./Core/Src/new_hope/asm_ec.o \
./Core/Src/new_hope/asm_ntt.o \
./Core/Src/new_hope/asm_poly.o \
./Core/Src/new_hope/crypto_stream_chacha20.o \
./Core/Src/new_hope/error_correction.o \
./Core/Src/new_hope/fips202.o \
./Core/Src/new_hope/newhope.o \
./Core/Src/new_hope/ntt.o \
./Core/Src/new_hope/poly.o \
./Core/Src/new_hope/print.o \
./Core/Src/new_hope/randombytes.o \
./Core/Src/new_hope/reduce.o \
./Core/Src/new_hope/server.o \
./Core/Src/new_hope/stm32f0_wrapper.o 

S_DEPS += \
./Core/Src/new_hope/asm_KeccakF-1600.d \
./Core/Src/new_hope/asm_chacha.d \
./Core/Src/new_hope/asm_ec.d \
./Core/Src/new_hope/asm_ntt.d \
./Core/Src/new_hope/asm_poly.d 

C_DEPS += \
./Core/Src/new_hope/crypto_stream_chacha20.d \
./Core/Src/new_hope/error_correction.d \
./Core/Src/new_hope/fips202.d \
./Core/Src/new_hope/newhope.d \
./Core/Src/new_hope/ntt.d \
./Core/Src/new_hope/poly.d \
./Core/Src/new_hope/print.d \
./Core/Src/new_hope/randombytes.d \
./Core/Src/new_hope/reduce.d \
./Core/Src/new_hope/server.d \
./Core/Src/new_hope/stm32f0_wrapper.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/new_hope/asm_KeccakF-1600.o: ../Core/Src/new_hope/asm_KeccakF-1600.s Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Core/Src/new_hope/asm_KeccakF-1600.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/new_hope/asm_chacha.o: ../Core/Src/new_hope/asm_chacha.s Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Core/Src/new_hope/asm_chacha.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/new_hope/asm_ec.o: ../Core/Src/new_hope/asm_ec.s Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Core/Src/new_hope/asm_ec.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/new_hope/asm_ntt.o: ../Core/Src/new_hope/asm_ntt.s Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Core/Src/new_hope/asm_ntt.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/new_hope/asm_poly.o: ../Core/Src/new_hope/asm_poly.s Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Core/Src/new_hope/asm_poly.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/new_hope/crypto_stream_chacha20.o: ../Core/Src/new_hope/crypto_stream_chacha20.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/crypto_stream_chacha20.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/error_correction.o: ../Core/Src/new_hope/error_correction.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/error_correction.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/fips202.o: ../Core/Src/new_hope/fips202.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/fips202.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/newhope.o: ../Core/Src/new_hope/newhope.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/newhope.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/ntt.o: ../Core/Src/new_hope/ntt.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/ntt.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/poly.o: ../Core/Src/new_hope/poly.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/poly.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/print.o: ../Core/Src/new_hope/print.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/print.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/randombytes.o: ../Core/Src/new_hope/randombytes.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/randombytes.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/reduce.o: ../Core/Src/new_hope/reduce.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/reduce.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/server.o: ../Core/Src/new_hope/server.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/server.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/new_hope/stm32f0_wrapper.o: ../Core/Src/new_hope/stm32f0_wrapper.c Core/Src/new_hope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"/home/sca-user/STM32Projects/new_hope_sca/Core/Src/new_hope" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -mthumb -fno-common -MD -DSTM32F4 -s -nostdlib -mcpu=cortex-m4 -fstack-usage -MMD -MP -MF"Core/Src/new_hope/stm32f0_wrapper.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

