global _start 
    

section .text
_start:
    mov rax, 520
    mov r9, rsp
    push 0
    sub rsp, 16

    sub r9, 8
    mov r8, 10

    .loop:
        xor rdx, rdx
        div r8
        or  rdx, 48
        sub r9, 8
        mov [r9], rdx
        test rax, rax
        jnz .loop 

    mov rax, 1
    mov rdi, 1
    mov rsi, r9
    mov rdx, 24
    syscall

    add rsp, 24

    mov rax, 60
    xor rdi, rdi
    syscall



    
