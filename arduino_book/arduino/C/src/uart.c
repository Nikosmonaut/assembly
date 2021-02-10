#include <avr/io.h>
#include <unistd.h>
#include <util/setbaud.h>
#include "utils.h"
#include "uart.h"

void uart_init(void) {
    // Set baud rate value
    // USART Baud RAte Register
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;

// USART Control and Status Register A
// Double transmission speed.
#if USE_2X
    UCSR0A |= _BV(U2X0);
#else
    UCSR0A &= ~(_BV(U2X0));
#endif

    // USART Control and Status Register B
    // Enable RX and TX EN like enable
    UCSR0B = _BV(RXEN0) | _BV(TXEN0);
    // USART Control and Status Register C
    // 8-bit data
    UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);
}

void uart_putchar(char c) {
    // if (c == '\n') {
    //     uart_putchar('\r');
    // }

    // Wait until UDRE0 Data Register Empty flag has 1 to indicate that UDR is
    // empty and can receive new data
    loop_until_bit_is_set(UCSR0A, UDRE0);

    UDR0 = c;
}

char convert_char(char number) {
    if (number == 0) {
        return 0x30;
    }
    if (number == 1) {
        return 0x31;
    }
    if (number == 2) {
        return 0x32;
    }
    if (number == 3) {
        return 0x33;
    }
    if (number == 4) {
        return 0x34;
    }
    if (number == 5) {
        return 0x35;
    }
    if (number == 6) {
        return 0x36;
    }
    if (number == 7) {
        return 0x37;
    }
    if (number == 8) {
        return 0x38;
    }
    if (number == 9) {
        return 0x39;
    }

    return number;
}

void uart_putnumber16(uint16_t number) {
    uint8_t digits[5] = {'0', '0', '0', '0', '0'};
    uint8_t index = 4;

    for (; number > 0; index--, number /= 10)
        digits[index] = (number % 10) + '0';

    uart_putchar(digits[0]);
    uart_putchar(digits[1]);
    uart_putchar(digits[2]);
    uart_putchar(digits[3]);
    uart_putchar(digits[4]);

    uart_putchar('\r');
    uart_putchar('\n');
}

void uart_putnumber8(uint8_t number) {
    uint8_t digits[3] = {'0', '0', '0'};
    uint8_t index = 2;

    for (; number > 0; index--, number /= 10)
        digits[index] = (number % 10) + '0';

    uart_putchar(digits[0]);
    uart_putchar(digits[1]);
    uart_putchar(digits[2]);

    uart_putchar('\r');
    uart_putchar('\n');
}

void uart_putnumber(uint8_t number) {
    char envers[8];
    int counter = 7;

    while (number > 0) {
        int mod = number % 10;
        envers[counter] = mod;
        // uart_putchar(mod);
        counter--;
        number = number / 10;
    }

    for (int i = 0; i < 8; i++) {
        uart_putchar(convert_char(envers[i]));
    }
    uart_putchar('\r');
    uart_putchar('\n');
}

void uart_putbits(char byte) {
    if (!byte) {
        return;
    };

    for (int i = 7; i >= 0; i--) {
        char bitValue = get_bit_value(byte, i);
        uart_putchar(bitValue == 0 ? '0' : '1');
    }

    uart_putchar('\r');
    uart_putchar('\n');
}
