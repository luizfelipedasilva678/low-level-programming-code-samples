global _start

section .bss
    buffer: resb 144

section .data
    fname: db 'input.txt', 0


section .text

_start:
    mov rax, 4
    mov rdi, fname
    mov rsi, buffer
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 8
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

