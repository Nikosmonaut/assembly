        .arch armv8-a

        .equ    STDOUT,1
        .equ    STDIN,0

        .section  .rodata
        .align 2
promptMsg:
        .asciz  "Enter an integer : "
        .equ    promptLngth,.-promptMsg

        .text
        .align 2
        .global main
        .type main, %function

main:
        str x30, [sp, -4]!
        str x29, [sp, -4]!
        add x29, sp, 4

        sub sp, sp, 40

        str x3, [x29, -8]
        mov x4, 0

        mov     x0, STDOUT
        ldr     x1, promptMsgAddr
        mov     x2, promptLngth
        bl      write

        mov     x0, STDIN
        ldr     x1, [x3, x4]
        mov     x2, 4
        bl      read

        mov x0, 0
        add sp, sp, 10
        ldr x29, [sp, 0]
        ldr x30, [sp, 4]
        add sp, sp, 8
        b      x30


        .align  2
promptMsgAddr:
        .word   promptMsg
