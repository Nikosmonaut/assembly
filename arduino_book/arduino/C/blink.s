	.file	"1_blink.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r24,lo8(36)
	ldi r25,0
	movw r30,r24
	ld r18,Z
	ldi r24,lo8(36)
	ldi r25,0
	ori r18,lo8(32)
	movw r30,r24
	st Z,r18
	ldi r24,0
	ldi r25,0
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	main, .-main
	.ident	"GCC: (Fedora 9.2.0-3.fc32) 9.2.0"
