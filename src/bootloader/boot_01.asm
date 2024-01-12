;This is 1st & simple bootloader program
ORG 0x7C00 ;Originate from address
BITS 16 ;tell assembler that this is 16 bit arch

start:
;start means we can write code here
	mov ah, 0eh
	mov al, 'A'
	int 0x10 ; this is interrupt 0x10 is calling the BIOS.

	jmp $ ;keep jumping to itself

times 510-($ - $$) db 0 ; fill atleast 510 bytes of data
dw 0xAA55 ;assemble word 
