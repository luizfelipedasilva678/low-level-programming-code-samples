%define O_RDONLY 0
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2


global _start

section .data
    number: db 10
    fname: db 'input.txt', 0

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

print_string:
    push rdi
    call string_length
    pop rsi
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    ret

print_uint:
    mov rax, rdi
    mov rdi, rsp
    push 0
    sub rsp, 16

    dec rdi
    mov r8, 10
    
    .loop:
        xor rdx, rdx
        div r8
        or dl, 48 ;; This gives the ASCII code
        dec rdi
        mov [rdi], dl
        test rax, rax
        jnz .loop


    call print_string

    add rsp, 24

    ret

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

_end:
    mov rdi, rax
    call print_uint

    mov rax, 60
    mov rdi, 0
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
    mov r9, rax
    dec r9

    .loop:
        mul r9

        cmp r9, 1
        je _end
        dec r9
        jmp .loop
