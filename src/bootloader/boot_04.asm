ORG 0 ; changing the orgin to 0
BITS 16 ; 16 bits arch
_start: ; This will jump to the first 3 bytes 
	jmp short start
	nop

times 33 db 0 ; this will turn 1st 33 bytes to 0 as described in BPB(https://wiki.osdev.org/FAT#BPB_.28BIOS_Parameter_Block.29)

start:
	jmp 0x7c0:step2

handle_zero:
	mov ah, 0eh
	mov al, 'A'
	mov bx, 0x00
	int 0x10
	iret

handle_one:
	mov ah, 0eh
	mov al, 'V'
	mov bx, 0x00
	int 0x10
	iret

step2:
	cli ; Clear Interrupts
	mov ax, 0x7c0
	mov ds, ax
	mov es, ax
	mov ax, 0x00
	mov ss, ax
	mov sp, 0x7c00
	sti ; enables Interrupts

	;Changing the Interrupt Vector Table
	; 1st interrupt 0
	mov word[ss:0x00], handle_zero ;use stack segment by default it'll use data segment
	mov word[ss:0x02], 0x7c0

	; interrupt 1
	mov word[ss:0x04], handle_one
	mov word[ss:0x06], 0x7c0

	int 1 ; this will call the interrupt
;
;	mov ax, 0x00
;	div ax
;
;	int 0

	mov si, message ; si will point to first char in message
	call print ; calls the print routine
	jmp $	; jumps back to start

print: ;This will call routine print_char
	mov bx, 0
.loop: ;Sublabel
	lodsb ; This will load the char in si register which is pointing to and load it in al 
	cmp al, 0 ;compare al reg to 0
	je .done ; if 0 jump done
	call print_char ;calls print_char
	jmp .loop

.done:
	ret

print_char: ;This is routine
	mov ah, 0eh
	int 0x10 ; call the BIOS
	ret 
	
message: db 'Hello, World!', 0

times 510-($ - $$) db 0
dw 0xAA55 ; little endian
