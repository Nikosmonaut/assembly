#include <adc.h>
#include <avr/io.h>
#include <util/delay.h>

uint16_t map_to_buzzer(uint16_t value) { return value * 4.826 + 62; }

int main(void) {
    uint16_t sensorValue = 0;
    adc_init();

    // Set pint 9 as output
    DDRB |= _BV(PORTB1);
    // Clear OC1A on compare match, set OC1A at BOTTOM (non-inverting mode)
    TCCR1A |= _BV(COM1A1);

    // Set fast PWM mode 14
    TCCR1A |= _BV(WGM11);
    TCCR1B |= _BV(WGM13) | _BV(WGM12);

    // Prescaler /64
    TCCR1B |= _BV(CS11) | _BV(CS10);

    while (1) {
        sensorValue = adc_read_value(0);

        ICR1 = map_to_buzzer(sensorValue);
        OCR1A = ICR1 / 2;
        _delay_ms(100);
    }

    return 1;
}