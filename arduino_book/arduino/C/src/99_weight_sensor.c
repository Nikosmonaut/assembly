#include <adc.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <stdio.h>
#include <uart.h>
#include <util/delay.h>
#include <util/setbaud.h>
#include <utils.h>

int main(void) {
    uart_init();
    adc_init();

    uint16_t adc0 = 0;
    uint16_t adc1 = 0;

    while (1) {
        adc0 = adc_read_value(0);
        uart_putnumber16(adc0);

        adc1 = adc_read_value(1);
        uart_putnumber16(adc1);

        uart_putchar('-');
        uart_putchar('-');
        uart_putchar('-');
        uart_putchar('-');
        uart_putchar('\r');
        uart_putchar('\n');
        _delay_ms(1000);
    }

    return 1;
}