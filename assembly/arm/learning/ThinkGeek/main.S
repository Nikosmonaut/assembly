    .arch armv8-a
    .data
    .align 2

one_var : .word 42
another_var : .word 66

    .global result_var
result_var: .word 0

    .text
    .align 2
    .global main

main:
    stp x29, x30, [sp, -16]!
    ldr x0, addr_one_var
    ldr x0, [x0]
    ldr x1, addr_another_var
    ldr x1, [x1]
    add x0, x0, x1
    ldr x1, addr_result
    str x0, [x1]
    bl inc_result
    mov x0, #0
    ldp x29, x30, [sp], 16
    ret

addr_one_var: .dword one_var
addr_another_var: .dword another_var
addr_result: .dword result_var
