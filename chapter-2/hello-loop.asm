global _start

section .data
message: db "Hello, World!", 10

section .text
_start:
    mov rcx, 60
.loop:
    sub rcx, 1

    mov rax, 1
    mov rdi, 1                              
    mov rsi, message
    mov rdx, 14
    push rcx
    syscall
    pop rcx
    test rcx, rcx
    jnz .loop
    mov rax, 60
    xor rdi, rdi
    syscall
