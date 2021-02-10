section .data
  msg db "Enter a digit : "
  lenMsg equ $ - msg
  resultMsg db "The sum is : "
  lenResultMsg equ $ - resultMsg

section .bss
  digitOne resb 2
  digitTwo resb 2
  sumRes resb 1

section .text
  global _start

_start:
  ; Show first digit prompt
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, lenMsg
  syscall


  choice db 'y'

  ; Read stdin to digitOne
  mov rax, 0
  mov rdi, 0
  mov rsi, digitOne
  mov rdx, 2
  syscall

  ; Show second digit prompt
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, lenMsg
  syscall

  ; Read stdin to digitOne
  mov rax, 0
  mov rdi, 0
  mov rsi, digitTwo
  mov rdx, 2
  syscall

  mov rax, [digitOne]
  sub rax, '0'
  mov rbx, [digitTwo]
  sub rbx, '0'

  add rax, rbx
  add rax, '0'

  mov [sumRes], rax

  mov rax, 1
  mov rdi, 1
  mov rsi, sumRes
  mov rdx, 1
  syscall

  mov rax, 60       ; exit(
  mov rdi, 0        ;   EXIT_SUCCESS
  syscall           ; );
