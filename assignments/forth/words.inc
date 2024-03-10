%include "macro.inc"


section .data
    message1 db "Hello, World!", 0
    message2 db "Hello, World! 2", 0
    message3 db "Hello, World! 3", 0

native 'testando', testando
    mov rax, 1
    mov rdi, 1
    mov rsi, message1
    mov rdx, 14
    syscall

native 'testando1', testando1
    mov rax, 1
    mov rdi, 1
    mov rsi, message2
    mov rdx, 15
    syscall

native 'testando2', testando2
    mov rax, 1
    mov rdi, 1
    mov rsi, message3
    mov rdx, 15
    syscall