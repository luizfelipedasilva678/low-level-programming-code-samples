section .data
w_plus:
    dq 0
    db '+', 0
    db 0
xt_plus:
    dq plus_impl
w_dup:
    dq w_plus
    db 'dup', 0
    db 0
xt_dup:
   dq dup_impl
w_double:
    dq w_dup
    db 'double', 0
    db 0
    dq docol
    dq xt_dup
    dq xt_plus
    dq xt_exit

last_word: dq w_double
section .text
  plus_impl:
    pop rax
    add rax, [rsp]
    mov [rsp], rax
    jmp next
  dup_impl: 
    push qword [rsp]
    jmp next
