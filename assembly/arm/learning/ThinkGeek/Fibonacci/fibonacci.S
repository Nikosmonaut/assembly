    .text
    .balign 2
    .global fibonacci

    .type fibonacci, %function
fibonacci:
    // Prologue
    stp x29, x30, [sp, -16]!
    sub x29, x29, 8

    // Let's simulate fibonacci as
    // -1, 1, 0, 1, 1, 2, 3, 5
    // Initialization

    // x0 : Params index n
    // x1 : fn-1
    // x2 : fn-2
    // x3 : current fn
    // x4 : current loop counter

    mov x1, 1
    mov x2, -1

    mov x4, 0
loop:
    add x3, x1, x2
    mov x2, x1
    mov x1, x3

    cmp x4, x0
    beq end

    add x4, x4, 1
    b loop

end:

    // Epilogue
    mov x0, x3
    ldp x29, x30, [sp], 16
    ret
