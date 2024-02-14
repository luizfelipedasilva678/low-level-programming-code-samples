%include "colon.inc"
%define OFFSET 8

extern print_newline
extern print_string
extern string_length

global _start

section .data
    colon "third key", third_element
    
    colon "second key", second_element

    colon "first key", first_element

section .text

end:
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov r9, next

    .loop:
        lea rdi, [r9 + OFFSET]
        call print_string

        call print_newline

        mov r9, qword [r9]
        cmp r9, 0
        jz end 
    jmp .loop




