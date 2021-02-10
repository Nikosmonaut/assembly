.text

.global inc_result

inc_result:
    ldr x1, addr_result
    ldr x0, [x1]
    add x0, x0, #1
    str x0, [x1]
    ret

addr_result: .dword result_var
