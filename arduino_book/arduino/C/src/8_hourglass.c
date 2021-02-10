#include <avr/io.h>
#include <uart.h>

void timer0_overflow(void) {
    while (!(TIFR0 & _BV(TOV0))) {
        ;
    }

    return;
}

int main(void) {
    uint8_t secondCounter = 0;
    uint16_t frequencyCounter = 0;

    uart_init();

    // 62500 hz counter without prescale with 8bits capacity
    // No prescaling
    TCCR0B |= _BV(CS00);
    // Init timer counter
    TCNT0 = 0x00;

    while (1) {
        timer0_overflow();
        TIFR0 |= _BV(TOV0);
        if (frequencyCounter < 65500) {
            frequencyCounter++;
        } else {
            frequencyCounter = 0;
            secondCounter++;
            uart_putnumber8(secondCounter);
        }
    }

    return 1;
}