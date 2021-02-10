    .cpu    cortex-a72
    .fpu    neon-fp-armv8
    .syntax unified         @ modern syntax
    .equ    STDOUT,1

    .text
    .align 2
    .global main
    .type   main, %function

main:
    @ Prologue main
    sub sp, sp, 8
    str lr, [sp, 4]
    str fp, [sp, 0]

    add fp, sp, 4
    sub sp, sp, 4

    @ Use of r3 register because previous will
    @ be used for write sys call
    mov r3, 'A
    b compare
continue:
    str r3, [sp]

    mov r0, STDOUT
    mov r1, sp
    mov r2, 1
    bl write

    @ Load r3 from stack
    ldr r3, [sp]
    add r3, r3, 1
compare:
    cmp r3, 'Z
    bls continue

    @ Epilogue main
    ldr lr, [sp, 8]
    ldr fp, [sp, 4]
    add sp, sp, 12

    mov r0, 0
    bx lr
