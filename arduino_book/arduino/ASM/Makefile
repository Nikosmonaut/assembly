# avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c;
# avr-gcc -mmcu=atmega328p led.o -o led;
# avr-objcopy -O ihex -R .eeprom led led.hex;
# avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex;

BIN=1_blink
MCU=atmega328p
PORT=/dev/ttyACM0
CC=avra
OBJCOPY=avr-objcopy
BUILD_PATH=build
OBJECTS=
SRC_PATH=src

all: ${BUILD_PATH}/${BIN}.ihex

${BUILD_PATH}/%.ihex: ${BUILD_PATH}/%.elf
	${OBJCOPY} -O ihex -R .eeprom $< $@

${BUILD_PATH}/${BIN}.elf: ${BUILD_PATH}/${BIN}.o ${BUILD_PATH}/uart.o ${BUILD_PATH}/adc.o ${BUILD_PATH}/utils.o
	${CC} -I ./include -mmcu=${MCU} -o ${BUILD_PATH}/${BIN}.elf $^

${BUILD_PATH}/%.o: ${SRC_PATH}/%.c
	${CC} -I ./include -mmcu=${MCU} -Wall -Os -c -o $@ $<

install: ${BUILD_PATH}/${BIN}.ihex
	avrdude -D -F -V -c arduino -p ${MCU} -P ${PORT} -b 115200 -U flash:w:$<

# installDebug: ${BUILD_PATH}/${BIN}.ihex
# 	avrdude -P usb -D -F -V -c arduino -p ${MCU} -P ${PORT} -b 115200 -U flash:w:$<

clean:
	rm -rf ${BUILD_PATH}/*
