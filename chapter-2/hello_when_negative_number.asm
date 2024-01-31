global _start 
    

section .text
    message: db 'Hello', 10

_end: 
    mov rax, 60
    mov rdi, 1
    syscall

hello: 
    push rax
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    jmp _end

_start:
    mov rax, -48

    neg rax

    test rax, rax
    js hello

    



    
