ORG 0x7C00
BITS 16 ; 16 bits arch

start:
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
