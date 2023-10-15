NOME = tstBiblioteca

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -r *.o
%.o: %.asm
	nasm -f elf64 $<

