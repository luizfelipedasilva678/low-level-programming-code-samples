global find_word

extern string_equals
extern string_length
section .text

find_word:
    mov rsi, last_word

    .loop:
        push rsi
        push rdi
        add rsi, 8
        call string_equals
        pop rdi
        pop rsi

        cmp rax, 1
        je .found
        
        mov rsi, [rsi]
        cmp rsi, 0
        je .not_found
        
        jmp .loop

    .found:
        mov rax, rsi
        ret
    
    .not_found:
        mov rax, 0
        ret

cfa:
    push rdi
    add rdi, 8
    call string_length
    pop rdi
    lea rax, [rdi + 8 + rax + 2] ;; 2 is for the flags and the null terminator
    ret