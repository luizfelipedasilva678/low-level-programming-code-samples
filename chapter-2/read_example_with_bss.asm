global _start


section .bss         
   data resb 1

_start:

    mov rax, 0
    mov rdi, 0
    mov rsi, data
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, data
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall