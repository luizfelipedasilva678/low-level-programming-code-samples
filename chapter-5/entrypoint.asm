extern print_char
global _start

section .text

_start:
    mov rdi, 'p'
    call print_char

    mov rax, 60
    mov rdi, 0
    syscall
