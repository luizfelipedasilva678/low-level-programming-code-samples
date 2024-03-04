global _start

section .data
    message: db "Hello World", 0
    length: equ $-message

section .text 

_start:
    mov r9, 0

    push 0
    mov rax, 0
    mov rdi, 0
    mov rsi, rsp
    mov rdx, 1
    syscall
    pop r8


    .loop:  
    push r8
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, length
    syscall
    pop r8
    inc r9
    cmp r9, 10
    je .end
    jmp .loop

    .end:
    mov rax, 60
    xor rdi, rdi
    syscall