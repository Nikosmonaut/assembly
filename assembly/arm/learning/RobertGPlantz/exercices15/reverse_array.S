    .cpu cortex-a72
    .fpu    neon-fp-armv8
    .syntax unified

    .text
    .align 2
    .global reverseArray
    @ .type  main, %function
    .type  reverseArray, %function

reverseArray:
    @ Epilogue
    str lr, [sp, -4]
    str fp, [sp, -8]
    str r4, [sp, -12]
    str r5, [sp, -16]
    sub fp, sp, 4
    sub sp, sp, 20

    @ counter
    mov r4, 9
    @ array ref
    mov r5, r0

loop:
    cmp r4, 0
    blt end

    @ offset address
    lsl r0, r4, #2
    add r0, r5, r0

    ldr r1, [r0]
    sub r0, fp, 16
    bl uIntToDec

    mov r0, 1
    sub r1, fp, 16
    mov r2, 1
    bl write

    sub r4, r4, 1
    b loop
end:
    @ Prologue
    ldr lr, [fp]
    ldr fp, [fp, 4]
    ldr r4, [fp, 8]
    ldr r4, [fp, 12]
    add sp, sp, 20
    bx lr

@ main:
