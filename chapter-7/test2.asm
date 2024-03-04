global _start


section .data
    str1: db "Testando", 0
    str2: db "Testando", 0
    str3: db "Igual", 0

section .text

_start:
    mov r8, str2
    mov r9, str1

    .loop:
        mov al, [r8]
        cmp al, [r9]
        jne .exit
        inc r8
        inc r9

        mov rax, 1
        mov rdi, 1
        mov rsi, str3
        mov rdx, 6
        syscall

        cmp byte [r8], 0
        jne .loop
        cmp byte [r9], 0
        jne .loop

    .exit:
        mov rax, 60
        mov rdi, 0
        syscall