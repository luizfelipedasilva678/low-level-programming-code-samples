global _start

section .text
_start:
    mov r9, rsp
    push 0
    sub rsp, 16

    mov byte [r9], 65

    mov rax, 1
    mov rdi, 1
    mov rsi, r9
    mov rdx, 2
    syscall


    add rsp, 24

    mov rax, 60
    xor rdi, rdi
    syscall