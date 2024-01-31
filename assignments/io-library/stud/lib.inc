section .text

exit:
    mov rax,60
    syscall
    ret

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
    

;;Another solution for print_string

;;print_string:
    ;;xor rax, rax
    ;;mov rcx, rdi

    ;;.loop:
       ;;cmp byte [rcx + rax], 0
        
        ;;je .end

        ;;lea rsi, [rcx + rax]

        ;;push rax
            ;;mov rax, 1
            ;;mov rdi, 1
            ;;mov rdx, 1

            ;;push rcx
            ;;syscall
            ;;pop rcx

        ;;pop rax
        ;;inc rax
        ;;jnz .loop
    ;;.end:
        ;;ret

print_char:
    push rdi
    mov rdi, rsp
    call print_string
    pop rdi
    ret

print_newline:
    mov rdi, 10
    call print_char
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


print_int:
    test rdi, rdi
    jns print_uint
    push rdi
    mov rdi, '-'
    call print_char
    pop rdi
    neg rdi
    call print_uint

string_equals:
    xor rax, rax
    ret


read_char:
    xor rax, rax
    ret 

read_word:
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_uint:
    xor rax, rax
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_int:
    xor rax, rax
    ret 


string_copy:
    ret
