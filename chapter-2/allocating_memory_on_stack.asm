global _start
section .data
    number: db 253

section .text
_start:
    sub rsp, 16
    mov r8, 10

    xor rdx, rdx
    mov rax, [number]
    div r8
    or rdx, 48

    push rdx

    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall

    add rsp, 24

    mov rax, 60
    xor rdi, rdi
    syscall