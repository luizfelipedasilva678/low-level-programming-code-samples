
global _start

section .data
    number: db 123

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

_end:
    mov rdi, r8
    call print_uint

    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov rax, [number]
    xor r8, r8
    mov r9, 10

    .loop:
        xor rdx, rdx
        div r9
        add r8, rdx

        test rax, rax
        jz _end
        jmp .loop