global _start

%define rstack r14

section .bss
    resq 1023
    initial_value: resq 1

section .data
    letter: dq 'A'

section .text

_start:
    mov rstack, initial_value

    sub rstack, 8
    mov qword [rstack], 'A'

    mov rax, 1
    mov rdi, 1
    mov rsi, rstack
    mov rdx, 8
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall