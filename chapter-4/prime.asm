global _start

section .data
    number: db 10

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
    xor r8, r8
    mov r9, 1

    .loop:
        xor rdx, rdx
        mov rax, [number]
        div r9

        cmp r9, [number]
        jg _end
        inc r9
        cmp rdx, 0
        je increment_r8
        jmp .loop
