#ifndef UART_H_INCLUDED
#define UART_H_INCLUDED

#define F_CPU 16000000UL
#define BAUD 9600

/*
 * Init frequency
 * Set Rx and Tx and open
 * Init 8 bit data
 */
void uart_init(void);

/*
 * Output value as bits
 */
void uart_putbits(char v);

/*
 * Output a char
 */
void uart_putchar(char c);

/*
 * Output an number
 */
void uart_putnumber8(uint8_t number);

void uart_putnumber16(uint16_t number);

#endif