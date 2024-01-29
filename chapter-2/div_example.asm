;; Note: the result will be converted to ascii character

global _start

section .data
    divisor: db 1
    result: dq 0

section .text

_start:
    mov rax, 48
    div qword [divisor]

    mov [result], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, result 
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall