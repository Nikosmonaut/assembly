    .data

prompt_msg: .asciz "Enter the Nth fibonacci order : "
    .equ prompt_msg_len,.-prompt_msg

prompt_n: .dword 0

    .text
    .align 2
    .global main

main:
    stp x29, x30, [sp, -16]!
    sub x29, x29, 8

    mov w0, 1
    ldr x1, prompt_msg_addr
    mov x2, prompt_msg_len
    bl  write

    mov w0, 2
    ldr x1, prompt_n_addr
    mov x2, 8
    bl read

    // x0 : Original string as number
    ldr x0, prompt_n_addr
    ldr x0, [x0]

    // x1 : Loop counter
    mov x1, 0

    // x3 : Entered value as int
    mov x3, 0

    // x4 : Stored as int
    mov x4, 0

    // x5, Multiplier for shift
    mov x5, 8
    // x6, Multiplier for 10
    mov x6, 10

loop:
    // x2 : Temp register with value as string

    // Move the needed byte to x2
    mul x1, x1, x5
    lsr x2, x0, x1
    udiv x1, x1, x5
    and x2, x2, 0xFF

    // Compare this byte if end of line
    cmp x2, 0x0a
    beq end

    // Subtract ascii offset to get decimal number
    sub x2, x2, 0x30

    // Multiply by decimal power
    mul x1, x1, x6
    mul x4, x2, x1
    udiv x1, x1, x6

    b loop

end:

    mov w0, 0
    ldp x29, x30, [sp], 16
    ret

prompt_msg_addr: .dword prompt_msg
prompt_n_addr: .dword prompt_n
