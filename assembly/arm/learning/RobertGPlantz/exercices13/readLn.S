    .cpu    cortex-a72
    .fpu    neon-fp-armv8
    .syntax unified

    .equ character, -8
    .equ counter, -12
    .equ STDIN, 0

    .text
    .align 2
    .global readLn
    .type readLn, %function

readLn:
    @ Prologue
    str lr, [sp, -4]
    str fp, [sp, -8]
    sub fp, sp, 4
    sub sp, sp, 16

    @ Init stack
    str r0, [fp, character]
    mov r0, 0
    str r0, [fp, counter]

loopRead:
    @ Read char, return at r0
    mov r0, STDIN
    add r1, fp, character
    ldr r1, [r1]
    mov r2, 1
    bl  read

    @ Load actual address to store in r1
    add r1, fp, character
    @ Inc r1
    add r1, r1, 1
    @ Store back to stack
    ldr r1, [fp, character]

    ldr r2, [fp, counter]
    add r2, r2, 1
    str r2, [fp, counter]

    @ Compare
    cmp r0, '\n
    bne loopRead

    mov r1, 0x0
    ldr r2, [fp, counter]
    add r2, r2, 1
    str r2, [fp, counter]

    @ Epilogue
    ldr fp, [fp, -4]
    ldr lr, [fp]
    add sp, sp, 16
    bx  lr