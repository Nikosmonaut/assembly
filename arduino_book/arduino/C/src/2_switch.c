#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>
#include <utils.h>

int main (void) {
    char switchState = 0;

    // Set port 2 input for
    DDRD = DDRD & ~_BV(DDD2);
    DDRD = DDRD | _BV(DDD3);
    DDRD = DDRD | _BV(DDD4);
    DDRD = DDRD | _BV(DDD5);

    while(1) {
        switchState = get_bit_value(PIND, PIND2);

        if (switchState == 0) {
            PORTD = PORTD | _BV(PORTD3);
            PORTD = PORTD & ~_BV(PORTD4);
            PORTD = PORTD & ~_BV(PORTD5);
        } else {
            PORTD = PORTD & ~_BV(PORTD3);
            PORTD = PORTD & ~_BV(PORTD4);
            PORTD = PORTD | _BV(PORTD5);

            _delay_ms(250);

            PORTD = PORTD | _BV(PORTD4);
            PORTD = PORTD & ~_BV(PORTD5);

            _delay_ms(250);
        }
    }

    return 1;
}