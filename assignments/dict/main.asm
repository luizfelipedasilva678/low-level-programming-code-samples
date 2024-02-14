extern find_word
extern print_string


global _start

section .data
    %include "words.inc"
    key: db "first key", 0
    msg: db "Value not found", 0
    MSG_SIZE equ $-msg

section .text

end:
    mov rax, 60
    mov rdi, 0
    syscall

print_result:
    mov rdi, rax
    call print_string
    jmp end

nothing_found:
    mov rax, 1
    mov rdi, 2
    mov rsi, msg
    mov rdx, MSG_SIZE
    syscall

    jmp end

_start:
    mov rdi, key
    mov rsi, next
    call find_word

    cmp rax, 0
    jne print_result

    jmp nothing_found
