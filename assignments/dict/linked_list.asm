%define OFFSET 8
%define SCALE 2

global _start

section .text

x1: 
    dq x2
    dq 48 ;; Zero

x2:
    dq x3
    dq 49 ;; One

x3:
    dq x4
    dq 50 ;; Two

x4:
    dq x5
    dq 51 ;; Three

x5:
    dq 0
    dq 52 ;; Four

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
        
        cmp qword [x1 + r8 * SCALE], 0 
        jz end
        add r8, OFFSET
    jmp .loop    