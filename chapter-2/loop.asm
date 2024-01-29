global _start

section .data
    message: db "Hello", 10

section .text

_start:
    mov rax, 60

    .loop:

    push rax
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 6
    syscall
    pop rax

    dec rax
    jnz .loop

    mov rax, 60
    mov rdi, 0
    syscall

    