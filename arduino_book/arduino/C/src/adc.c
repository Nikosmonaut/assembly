#include <adc.h>
#include <stdio.h>
#include <avr/io.h>
#include <stdio.h>
#include <stdint.h>

void adc_init(void) {
    ADMUX |= _BV(REFS0); // Set ADC reference to AVCC
    // ADMUX |= _BV(ADLAR); // Left adjust ADC result to allow easy 8 bit
    // reading
    //    ADCSRA |= (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); // Set ADC
    //    prescalar to 128 - 125KHz sample rate @ 16MHz
    ADCSRA |= _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0);
    ADCSRA |= _BV(ADEN); // Enable ADC
}

uint16_t adc_read_value(char mux) {
    ADMUX = (1 << REFS0) | (mux & 0x0f); // select input and ref
    ADCSRA |= (1 << ADSC);                 // start the conversion

    while (ADCSRA & (1 << ADSC))
        ; // wait for end of conversion

    return ADCW;
}