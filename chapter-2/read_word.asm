global _start

section .bss
    data: resb 8

section .text

read_char:
    push 0
    mov rax, 0
    mov rdi, 0
    mov rsi, rsp
    mov rdx, 1
    syscall
    pop rax
    ret


_end: 
    mov byte [rdi + r9], 0

    push rdi

    mov rax, 1
    mov rdi, 1
    mov rsi, [rsp] 
    mov rdx, 8
    syscall

    pop rdi

    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov rdi, data
    mov r8, 8
    xor r9, r9
    dec r8

    .read_loop:
        push rdi
        call read_char
        pop rdi
        
        cmp r9, r8
        jz _end

        ;; Ignore white spaces
        cmp al, 0x9 
        je .read_loop
        cmp al, 0x20
        je .read_loop
        cmp al, 0x10
        je .read_loop

        ;; End of loop when encounter nl
        cmp al, 0x0a
        je _end

        mov byte [rdi + r9], al
        inc r9 
        jmp .read_loop

  