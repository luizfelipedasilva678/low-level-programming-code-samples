codes: db '0123456789ABCDEF'

mov, rsi, codes
mov, resi, [codes]
lea rsi, [codes]

mov rsi, [codes + rax]
lea rsi, [codes + rax]