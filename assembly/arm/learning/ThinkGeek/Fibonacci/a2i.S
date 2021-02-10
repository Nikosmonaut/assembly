    .data
char: .byte 0

    .text
    .balign 2
    .global a2i

	.type	a2i, %function
a2i:
    // Prologue
    stp x29, x30, [sp, -16]!
    // Set current frame pointer
    sub x29, x29, 8

    // x1 : loop counter
    mov x1, 0

    // x3 : int value
    mov x3, 0

loopCounterChars:
    // x2 : current analyzed char
    ldr x2, [x0, x1]
    and x2, x2, 0xFF

    cmp x2, '\0'
    beq loopCounterCharsEnd
    cmp x2, '\n'
    beq loopCounterCharsEnd

    // Inc loop counter
    add x1, x1, 1

    b loopCounterChars

loopCounterCharsEnd:
    sub x1, x1, 1

    // x4 : decimal multiplicator
    mov x4, 1
    mov x7, 10
loopGenerate:
    ldr x2, [x0, x1]
    and x2, x2, 0xFF

    // ascii digit to integer value
    sub x2, x2, '0'

    // if (x2 < 0 || x2 > 9) goto end
    cmp x2, 0
    blt end
    cmp x2, 9
    bgt end

    mul x6, x2, x4
    add x3, x3, x6

    // while x1 > 0
    cmp x1, 0
    beq end

    mul x4, x4, x7
    sub x1, x1, 1
    b loopGenerate

end:
    mov x0, x3
    // Epilogue
    ldp x29, x30, [sp], 16
    ret

char_addr: .dword char
