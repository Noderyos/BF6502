all:
	ca65 bios.s
	ca65 vect.s
	ca65 main.s
	ld65 -C bios.cfg bios.o vect.o main.o -o rom.bin -Ln bios.sym

	@echo "Verify if functions addresses in main.s is matching these :"
	@cat bios.sym

clean:
	rm *.o rom.bin bios.sym