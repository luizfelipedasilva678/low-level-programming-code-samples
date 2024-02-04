global _start

section .data
    str1: db 'sddd', 0
    str2: db 'sddd', 0
    message: db 'Not equal', 0

section .text

string_length:
    xor rax, rax

    .loop:
        cmp byte [rdi + rax], 0
        je .end
        inc rax
        jnz .loop
    .end:
        ret

not_equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 10
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

_end: 
    mov rax, 60
    mov rdi, 0
    syscall

_start: 
    mov rdi, str1
    call string_length
    mov r8, rax

    mov rdi, str2
    call string_length
    mov r9, rax
    
    cmp r8, r9
    jne not_equal

    xor r8, r8

    .loop:
        cmp byte [str1 + r8], 0
        jz _end

        mov al, [str1 + r8]
        mov cl, [str2 + r8]

        cmp al, al
        jnz not_equal

        inc r8
        jnz .loop
