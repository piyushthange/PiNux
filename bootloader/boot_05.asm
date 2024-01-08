;install bless for viewing the appended bytes using msg.txt
ORG 0 ; changing the orgin to 0
BITS 16 ; 16 bits arch
_start: ; This will jump to the first 3 bytes 
	jmp short start
	nop

times 33 db 0 ; this will turn 1st 33 bytes to 0 as described in BPB(https://wiki.osdev.org/FAT#BPB_.28BIOS_Parameter_Block.29)

start:
	jmp 0x7c0:step2

step2:
	cli ; Clear Interrupts
	mov ax, 0x7c0
	mov ds, ax
	mov es, ax
	mov ax, 0x00
	mov ss, ax
	mov sp, 0x7c00
	sti ; enables Interrupts

	mov ah, 2 ; read sector command
	mov al, 1 ; One sector to read
	mov ch, 0 ; cylinder low eight bits
	mov cl, 2 ;read sector two
	mov dh, 0 ; head number
	mov bx, buffer
	int 0x13
	
	jc error ; jump carry error

	mov si, buffer
	call print

	jmp $

error:
	mov si, error_msg
	call print

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

error_msg: db 'Failed to load sector'

times 510-($ - $$) db 0
dw 0xAA55 ; little endian

buffer:
