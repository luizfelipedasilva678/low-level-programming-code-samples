extern string_equals
extern string_length
extern read_word
extern print_string

native "find", find
    mov rsi, last_word
    pop r9

    .loop:
        push rsi
        add rsi, 8
        mov rdi, r9
        call string_equals
        pop rsi

        cmp rax, 1
        je .found
        
        mov rsi, [rsi]
        cmp rsi, 0
        je .not_found


    .found:
        push rsi
        jmp next
    
    .not_found:
        push 0
        jmp next

native "cfa", cfa
    pop rdi
    push rdi
    add rdi, 8
    call string_length
    pop rdi
    lea rax, [rdi + 8 + rax + 2] ;; 2 is for the flags and the null terminator
    push rax
    jmp next

native "init", init
    mov rstack, rstack_start
    mov pc, interpreter_stub
    jmp next

native "inbuf", inbuf
    push input_buf
    jmp next

native "word", word
    pop rdi
    call read_word
    push rax
    jmp next

native 'docol', docol
    sub rstack, 8
    mov [rstack], pc
    add w, 8
    mov pc, w
    jmp next

native 'exit', exit
    mov pc, [rstack]
    add rstack, 8
    jmp next

colon "interpreter", interpreter
    dq xt_inbuf, xt_word
    dq xt_find, xt_cfa, xt_execute
    dq xt_exit

native "execute", execute
    pop rdi
    mov [program_stub], rdi
    mov pc, program_stub
    jmp next

native "print", print
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 5
    syscall
    jmp next