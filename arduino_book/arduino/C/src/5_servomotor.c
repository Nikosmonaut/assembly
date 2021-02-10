#include <avr/io.h>
#define F_CPU 16000000UL
#include <util/delay.h>

int main(void) {
    DDRB |= _BV(PORTB1);
    // Clear OC1A on compare match, set OC1A at BOTTOM (non-inverting mode)
    TCCR1A |= _BV(COM1A1);

    // Set fast PWM mode 14
    TCCR1A |= _BV(WGM11);
    TCCR1B |= _BV(WGM13) | _BV(WGM12);

    // No prescaler
    // TCCR1B |= _BV(CS11) | _BV(CS10);
    TCCR1B |= _BV(CS10);

    // Set 20ms as frequency
    ICR1 = 319999;
    OCR1A = 22000;

    // Set pin 2 && 3 as input
    DDRD &= ~_BV(PORTD2) & ~_BV(PORTD3);
    DDRD |= _BV(PORTD4);

    while (1) {
        if (PIND & _BV(PIND2)) {
            PORTD |= _BV(PORTD4);
            OCR1A += 500;
            _delay_ms(100);
        } else {
            PORTD &= ~_BV(PORTD4);
        }

        if (PIND & _BV(PIND3)) {
            PORTD |= _BV(PORTD4);
            OCR1A -= 500;
            _delay_ms(100);
        } else {
            PORTD &= ~_BV(PORTD4);
        }
    }

    return 1;
}