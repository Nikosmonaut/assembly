@ echo4chars.s
@ Prompts user to enter 4 characters and echoes them
@ 2017-09-29: Bob Plantz

@ Define my Raspberry Pi
        .cpu    cortex-a72
        .fpu    neon-fp-armv8
        .syntax unified         @ modern syntax

@ Useful source code constants
        .equ    STDIN,0
        .equ    STDOUT,1
        .equ    char1,-8
        .equ    char2,-7
        .equ    char3,-6
        .equ    char4,-5
        .equ    nChars,4
        .equ    local,8

@ Constant program data
        .section  .rodata
        .align  2
promptMsg:
        .asciz  "Enter four characters: "
        .equ    promptLngth,.-promptMsg
responseMsg:
        .asciz	"You entered: "
        .equ    responseLngth,.-responseMsg

@ Program code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, 8       @ space for fp, lr
        str     fp, [sp, 0]     @ save fp
        str     lr, [sp, 4]     @   and lr
        add     fp, sp, 4       @ set our frame pointer
        sub     sp, sp, local   @ allocate memory for local var

        mov     r0, STDOUT      @ prompt user for input
        ldr     r1, promptMsgAddr
        mov     r2, promptLngth
        bl      write

        mov     r0, STDIN       @ from keyboard
        add     r1, fp, char1   @ address of 1st char
        mov     r2, 1           @ one char
        bl      read

        mov     r0, STDIN       @ from keyboard
        add     r1, fp, char2   @ address of 2nd char
        mov     r2, 1           @ one char
        bl      read

        mov     r0, STDIN       @ from keyboard
        add     r1, fp, char3   @ address of 3rd char
        mov     r2, 1           @ one char
        bl      read

        mov     r0, STDIN       @ from keyboard
        add     r1, fp, char4   @ address of 4th char
        mov     r2, 1           @ one char
        bl      read

        mov     r0, STDOUT      @ nice message for user
        ldr     r1, responseMsgAddr
        mov     r2, responseLngth
        bl      write

        mov     r0, STDOUT      @ echo user's characters
        add     r1, fp, char1   @ address of 1st char
        mov     r2, nChars      @ all four characters
        bl      write

        mov     r0, 0           @ return 0;
        add     sp, sp, local   @ delete local vars
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