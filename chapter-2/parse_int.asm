global _start

section .data
    str: db '-5499sdddd', 0

section .text  

print_signal:
    mov r8, '-'

    push r8

    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall

    pop r8
    inc r9
    jmp _start.loop
    
_print:
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret
     
_end:
    mov rax, 60
    mov rdi, 1
    syscall

_start:
    xor r9, r9

    .loop:
        cmp byte [str + r9], 0
        jz _end

        cmp byte [str + r9], '-'
        je print_signal
        
        cmp byte [str + r9], '0'
        jl _end
        cmp byte [str + r9], '9'
        jg _end

        lea rdi, [str + r9]
        call _print

        inc r9  
        jmp .loop

    