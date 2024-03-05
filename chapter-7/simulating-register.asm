%define pc r14
global _start


section .bss 
    resq 1023
    initial_value: resq 1

section .text

_start:
    mov pc, initial_value

    sub pc, 8
    mov byte [pc], '0'

    mov rax, 1
    mov rdi, 1
    mov rsi, pc
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi 
    syscall


