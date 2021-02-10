.data

.text
.global main

.balign 4

main:
    ldr x0, offset_of_GOT // r0 <= offset-to-GOT

got_address:
    add x0, pc, x0

    ldr x1, myvar_in_GOT
    add x0, [x0]

    ldr x1, [x0]
    add x1, x1, #1
    str x1, [x0]

    mov x0, #0
    ret


offset_of_GOT: .word _GLOBAL_OFFSET_TABLE_ - (got_address + 8)
myvar_in_GOT: .word myvar(GOT)
