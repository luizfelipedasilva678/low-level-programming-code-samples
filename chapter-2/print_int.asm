global _start 


section .data
    code: dq 56, 57

section .text

_start: 
    mov rax, 1
    mov rdi, 1
    mov rsi, code
    mov rdx, 16
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
