@ readLnSimple.s
@ Reads a line (through the '\n') from standard input. Deletes
@ the '\n' and creates a C-style text string.
@ Calling sequence:
@       r0 <- address of place to store string
@       bl    readLn
@ returns number of characters read, excluding NUL.
@ 2017-09-29: Bob Plantz

@ Define my Raspberry Pi
        .cpu    cortex-a53
        .fpu    neon-fp-armv8
        .syntax unified         @ modern syntax

@ Useful source code constants
        .equ    STDIN,0
        .equ    NUL,0
        .equ    LF,10     @ '\n' under Linux


@ The code
        .text
        .align  2
        .global readLn
        .type   readLn, %function
readLn:
        sub     sp, sp, 16      @ space for saving regs
        str     r4, [sp, 4]     @ save r4
        str     r5, [sp, 8]     @      r5
        str     fp, [sp, 12]    @      fp
        str     lr, [sp, 16]    @      lr
        add     fp, sp, 12      @ set our frame pointer

        mov     r4, r0          @ r4 = string pointer
        mov     r5, 0           @ r5 = count

        mov     r0, STDIN       @ read from keyboard
        mov     r1, r4          @ address of current storage
        mov     r2, 1           @ read 1 byte
        bl      read
whileLoop:
        ldrb    r3, [r4]        @ get just read char
        cmp     r3, LF          @ end of input?
        beq     endOfString     @ yes, input done
        add     r4, r4, 1       @ no, increment pointer var
        add     r5, r5, 1       @ count++
        mov     r0, STDIN       @ read from keyboard
        mov     r1, r4          @ address of current storage
        mov     r2, #1          @ read 1 byte
        bl      read
        b       whileLoop       @ and check for end
endOfString:
        mov     r0, NUL         @ string terminator
        strb    r0, [r4]        @ write over '\n'
        
        mov     r0, r5          @ return count;
        ldr     r4, [sp, 4]     @ restore r4
        ldr     r5, [sp, 8]     @      r5
        ldr     fp, [sp, 12]    @      fp
        ldr     lr, [sp, 16]    @      lr
        add     sp, sp, 16      @ space for saving regs
        bx      lr              @ return