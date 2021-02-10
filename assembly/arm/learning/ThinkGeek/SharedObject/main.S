.data
.global myvar

.text
.global main

.balign 8

main:
    ldr x0, addr_myvar
    ldr x1, [x0]
    add x1, x1, #1
    str x1, [x0]

    mov x0, #0
    ret

addr_myvar: .word myvar
