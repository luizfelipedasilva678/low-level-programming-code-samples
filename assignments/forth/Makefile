LD = ld
AS = nasm
ASFLAGS = -f elf64

program: main.o lib.o
	$(LD) main.o lib.o -o program

main.o: main.asm
	$(AS) $(ASFLAGS) main.asm

lib.o: lib.inc
	$(AS) $(ASFLAGS) lib.inc

clean:
	rm main.o lib.o 