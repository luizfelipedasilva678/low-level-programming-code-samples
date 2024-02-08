global _start

section .data
    number: db 4

section .text

found:
    mov rax, 60
    mov rdi, 0
    syscall

_end:
    mov rax, 60
    mov rdi, 1
    syscall

_start:
    mov r9, 1
    xor r8, r8 
    xor rax, rax
    mov rcx, [number]
    dec rcx

    cmp byte [number], 0
    jz _end
    cmp byte [number], 0
    jz _end

    .loop:
        add r9, r8

        push r9
        sub r9, r8
        mov r8, r9
        pop r9

        cmp byte [number], r8b
        je found
        cmp byte [number], r9b
        je found
        cmp rax, rcx
        jg _end
        inc rax
        jmp .loop