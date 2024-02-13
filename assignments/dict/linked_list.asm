%define OFFSET 8
%define SCALE 2

global _start

section .text

x1: 
    dq x2
    dq 48

x2:
    dq x3
    dq 49

x3:
    dq x4
    dq 50

x4:
    dq 0
    dq 51

end: 
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov r8, 0

    .loop:
        mov rax, 1
        mov rdi, 1
        lea rsi, [x1 + r8 * SCALE + OFFSET] 
        mov rdx, 1
        syscall

        add r8, 8
        cmp qword [x1 + r8 * SCALE], 0 
        jz end
    jmp .loop    