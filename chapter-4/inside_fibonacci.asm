%define O_RDONLY 0
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2


global _start

section .data
    number: db 4
    fname: db 'input.txt', 0

section .text

parse_uint:
    mov r8, 10
    xor rax, rax
    xor rcx, rcx
.loop:
    movzx r9, byte [rdi + rcx]
    cmp r9b, '0'
    jb .end
    cmp r9b, '9'
    ja .end
    xor rdx, rdx
    mul r8
    and r9b, 0x0f
    add rax, r9
    inc rcx
    jmp .loop
    .end:
    mov rdx, rcx
    ret

found:
    mov rax, 60
    mov rdi, 0
    syscall

_end:
    mov rax, 60
    mov rdi, 1
    syscall

_start:
    mov rax, 2
    mov rdi, fname
    mov rsi, O_RDONLY
    mov rdx, 0
    syscall

    mov r8, rax
    mov rax, 9
    mov rdi, 0
    mov rsi, 4096
    mov rdx, PROT_READ
    mov r10, MAP_PRIVATE
    mov r9, 0
    syscall

    mov rdi, rax
    call parse_uint
    mov rcx, rax

    cmp rcx, 0
    jz _end
    cmp rcx, 0
    jz _end
    
    dec rcx

    mov r9, 1
    xor r8, r8 
    xor rax, rax

    .loop:
        add r9, r8

        push r9
        sub r9, r8
        mov r8, r9
        pop r9

        cmp rcx, r8
        je found
        cmp rcx, r9
        je found
        cmp rax, rcx
        jg _end
        inc rax
        jmp .loop