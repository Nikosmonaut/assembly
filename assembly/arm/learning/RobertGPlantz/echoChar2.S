    .cpu cortex-a72
    .fpu neon-fp-arvm8
    .syntax unified

    .equ STDIN, 0
    .equ STDOUT, 1
    .equ aLetter, -5
    .equ local, 8

    .section .rodata
    .align 2
promptMsg:
    .asciz "Enter one character: "
    .equ promptLen, .-promptMsg
responseMsg:
    .asciz "You entered : "
    .equ responseLen, .-responseMsg

    .text
    .align 2
    .global main
    .type main, %function

main:
    sub sp, sp, 8
    str fp, [sp, 0]
    str lr, [sp, 4]
    add fp, sp, 4
    sub sp, sp, local

    mov r0, STDOUT
    ldr r1, promtMsgAddr
    mov r2, promptLen
    bl write

    mov     r0, STDIN       @ from keyboard
    add     r1, fp, aLetter @ address of aLetter
    mov     r2, 1           @ one char
    bl      read

    mov     r0, STDOUT      @ nice message for user
    ldr     r1, responseMsgAddr
    mov     r2, responseLngth
    bl      write

    mov     r0, STDOUT      @ echo user's character
    add     r1, fp, aLetter @ address of aLetter
    mov     r2, 1           @ one char
    bl      write

    mov     r0, 0           @ return 0;
    add     sp, sp, local   @ deallocate local var
    ldr     fp, [sp, 0]     @ restore caller fp
    ldr     lr, [sp, 4]     @       lr
    add     sp, sp, 8       @   and sp
    bx      lr              @ return

@ Addresses of messages
        .align  2
promptMsgAddr:
        .word   promptMsg
responseMsgAddr:
        .word   responseMsg