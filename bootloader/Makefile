all:
	nasm -f bin boot.asm -o boot.bin
	dd if=msg.txt >> boot.bin
