global _start



section .text
    data: db -1


_start:
    sub rsp, 1


    mov rax, 0
    mov rdi, 0
    mov rsi, rsp
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall

    add rsp, 1

    mov rax, 60
    xor rdi, rdi
    syscall