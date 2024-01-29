global _start

section .data
    multiplier: db 8
    result: dq 0

section .text

_start: 
    mov rax, 6
    mul qword [multiplier]

    mov [result], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, result 
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall