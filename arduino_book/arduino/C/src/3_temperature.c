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
    uint8_t mux = 0x00;
    uart_init();

    while (1) {
        adc_init();
        // uint8_t rawValue = ADCH;
        uint8_t rawValue = adc_read_value(mux);
        float voltage = ((float)rawValue / 1024.0) * 5.0;
        float temperature = (voltage - 0.5) * 100;
        uart_putnumber8((int)temperature);
        // float voltage = (float)rawValue * 5.0 / 255.0;
        // float temperature = (voltage - 0.5) * 100;
        // uart_putnumber16((int)temperature);
        // uart_putnumber(voltage);
        _delay_ms(1000);
    }

    return 1;
}