global _start

section .bss 
    buffer: resb 5

section .data
    message: db 'teste', 0

section .text

_end: 
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 5
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

_start:
    xor r9, r9


    .loop:
        cmp byte [message + r9], 0
        jz _end

        mov al, [message + r9]
        mov [buffer + r9], al

        inc r9
        jmp .loop
