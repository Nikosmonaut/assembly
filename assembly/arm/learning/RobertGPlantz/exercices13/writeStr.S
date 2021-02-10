    .cpu    cortex-a72
    .fpu    neon-fp-armv8
    .syntax unified         @ modern syntax

    .equ total, -8
    .equ char, -12

    .text
    .align 2
    .global writeStr
    .type writeStr, %function

writeStr:
    @ Prologue
    str lr, [sp, -4]!
    str fp, [sp, -4]!
    add fp, sp, 4
    sub sp, sp, 8

    @ Init total counter
    mov r1, 0

compare:
    ldrb r3, [r0]
    cmp r3, 0x00
    beq end

    @ store int values in stack
    str r1, [fp, total]
    str r0, [fp, char]
    mov r0, r3
    bl putchar

    @ restore int values from stack
    ldr r1, [fp, total]
    ldr r0, [fp, char]

    add r1, r1, 1
    add r0, r0, 1
    b compare

end:
    mov r0, r1
    ldr lr, [fp, 0]
    ldr fp, [fp, -4]
    add sp, sp, 16
    bx lr
