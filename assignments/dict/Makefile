LD = ld
AS = nasm
ASFLAGS = -f elf64

program: main.o dict.o lib.o
	$(LD) -o program main.o dict.o lib.o

main.o: main.asm
	$(AS) $(ASFLAGS) main.asm

lib.o: lib.inc
	$(AS) $(ASFLAGS) lib.inc

dict.o: dict.inc
	$(AS) $(ASFLAGS) dict.inc

clean:
	rm main.o dict.o lib.o