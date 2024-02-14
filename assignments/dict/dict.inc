global find_word

%define OFFSET 8

extern string_equals
extern string_length

section .text

find_word:
    mov r8, rdi
    mov r9, rsi

    .loop:
        lea rdi, [r9 + OFFSET]
        mov rsi, r8
        call string_equals

        cmp rax, 1
        je .found

        mov r9, qword [r9]
        cmp r9, 0
        jz .not_found
    jmp .loop

    .not_found:
        xor rax, rax
        ret

    .found:
        lea rdi, [r9 + OFFSET]
        call string_length
        lea rax, [r9 + OFFSET + rax + 1]
        ret


    
  
