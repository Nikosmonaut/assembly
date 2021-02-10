#include <adc.h>
#include <uart.h>
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    uint16_t x = 0;
    uint16_t y = 0;
    // Control SW
    DDRD |= _BV(DDD2);
    // Set to hide, switch on
    PORTD |= _BV(PORT2);

    adc_init();
    uart_init();

    while (1) {
        x = adc_read_value(0);
        y = adc_read_value(1);

        uart_putchar('x');
        uart_putchar(' ');
        uart_putnumber16(x);
        uart_putchar('y');
        uart_putchar(' ');
        uart_putnumber16(y);

        _delay_ms(1000);
    }

    return 1;
}