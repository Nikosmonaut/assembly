#include <avr/io.h>
#include <util/delay.h>
#include "adc.h"
#include "uart.h"

int main() {
    // ADC0
    uint8_t mux = 0x00;
    uint8_t photoResValue = 0;

    DDRD |= _BV(DDD6);

    OCR0A = 253;

    // Non inverted mode, High at bottom, low on match
    TCCR0A |= _BV(COM0A1);
    // Set to fast PWM
    TCCR0A |= _BV(WGM01) | _BV(WGM00);

    TCCR0B |= _BV(CS00);
    TCCR0B |= _BV(CS01);
    // TCCR0B |= _BV(CS02);

    adc_init();
    uart_init();

    while (1) {
        photoResValue = adc_read_value(mux);
        uart_putbits(photoResValue);
        // OCR0A = photoResValue;

        _delay_ms(1000);
    }

    return 1;
}