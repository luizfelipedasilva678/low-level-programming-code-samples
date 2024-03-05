next:
    mov w, pc
    add pc, 8
    mov w, [w]
    jmp [w]