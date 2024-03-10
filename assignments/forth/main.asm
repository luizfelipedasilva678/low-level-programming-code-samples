global _start

extern read_word

section .bss
    input_buf: resb 1024

%include "words.inc"
%include "dict.inc"

section .text

_start:
    mov rdi, input_buf
    mov rsi, 1024
    call read_word

    mov rdi, rax
    call find_word

    mov rdi, rax
    call cfa
    
    mov rax, [rax]
    jmp rax