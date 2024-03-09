%include "macro.asm"


native '+', plus
    pop rax
    add [rsp], rax
    jmp next

native '-', minus
    pop rax
    add rax, [rsp]
    jmp next