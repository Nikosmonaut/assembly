#include <avr/io.h>
#include <adc.h>
#include <uart.h>
#include <util/delay.h>

int main() {
    // Init PD6 as output
    DDRD |= _BV(DDD6);

    // Set PWM for 50% cycle.
    // We use counter0 at 8bits. So 256 max
    // So 128 is the half
    OCR0A = 10;

    TCCR0A |= _BV(COM0A1);

    TCCR0A |= _BV(WGM01) | _BV(WGM00);

    TCCR0B |= _BV(CS01);

    for (;;) {
        ;
    }

    return 1;
}