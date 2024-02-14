
%define OFFSET 8

global _start

section .text

x1: 
    dq x2
    dq '0'

x2:
    dq x3
    dq '1'

x3:
    dq x4
    dq '2'

x4:
    dq x5
    dq '3'

x5:
    dq 0
    dq '4'

end: 
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov r9, x1

    .loop:
        mov rax, 1
        mov rdi, 1
        lea rsi, qword [r9 + OFFSET] 
        mov rdx, 1
        syscall

        mov r9, qword [r9]
        cmp r9, 0
        jz end
    jmp .loop