global _start
%include "macro.inc"

%define pc r15
%define w r14
%define rstack r13

%include "words.inc"
section .bss
    resq 1023
    rstack_start: resq 1
    input_buf: resb 1024

section .data
    message: db 'test', 0
    last_word: dq lw
    program_stub: dq 0
    interpreter_stub: dq xt_interpreter

section .text

next: 
    mov w, pc
    add pc, 8
    mov w, [w]
    jmp [w]

_start:
    jmp init_impl