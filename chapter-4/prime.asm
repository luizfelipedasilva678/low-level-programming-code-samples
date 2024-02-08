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

print_string:
    push rdi
    call string_length
    pop rsi
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    ret

print_char:
    push rdi
    mov rdi, rsp
    call print_string
    pop rdi
    ret

increment_r8: 
    inc r8
    jmp _start.loop

prime:
    mov rdi, '0' 
    call print_char
    
    mov rax, 60
    mov rdi, 0
    syscall

not_prime:
    mov rdi, '1'
    call print_char
    
    mov rax, 60
    mov rdi, 0
    syscall

_end:   
    cmp r8, 2
    je prime
    cmp r8, 2
    jne not_prime

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

    xor r8, r8
    mov r9, 1

    .loop:
        xor rdx, rdx
        mov rax, rcx
        div r9

        cmp r9, rcx
        jg _end
        inc r9
        cmp rdx, 0
        je increment_r8
        jmp .loop
