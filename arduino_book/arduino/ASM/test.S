    .device ATmega328P
    .dseg
    .equ DDRB = 0x4
    .equ PORTB = 0x5

	.cseg
	.org 	0x00

	ldi	r16, 0x1		; load 00000001 into register 16
    out     DDRB, r16		; write register 16 to DDRB
    out     PORTB, r16		; write register 16 to PORTB

loop:	rjmp    loop			; stay in infinite loop
