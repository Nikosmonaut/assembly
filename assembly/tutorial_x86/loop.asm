  global _start

section .text
_start:
  mov rcx, 10

l1:
  mov rbx, rcx
  add rbx, '0'

  ; Print counter
  mov rax, 1
  mov rdi, 1
  mov rsi, rbx
  mov rdx, 1
  syscall
  loop l1

  mov rax, 60       ; syscall exit
  xor rdi, rdi      ; exit code 0
  syscall
