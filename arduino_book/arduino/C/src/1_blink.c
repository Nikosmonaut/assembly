#include <avr/io.h>

int main (void)
{
    /* set pin 5 of PORTB for output*/
    // Set Port D pins as all outputs
    DDRD = 0xff;
    // Set all Port D pins as HIGH
    PORTD = 0xFF;

    // while(1) {
        /* set pin 5 high to turn led on */
        // PORTB = PORTB | _BV(PORTB5);
        // _delay_ms(ON_DELAY);

        /* set pin 5 low to turn led off */
        // PORTB = PORTB & ~_BV(PORTB5);
        // _delay_ms(OFF_DELAY);
    // }

    return 0;
}
