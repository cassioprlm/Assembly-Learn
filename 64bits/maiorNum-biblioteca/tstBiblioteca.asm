%include "biblioteca.inc"

section .text

global _start

_start:
	lea rsi, [BUFFER]; Load Effective Address
	add rsi, 0x9
	mov byte[esi], 0xA

	dec esi
	mov dl, 0x11 ; 'A'
	add dl, '0' 
	mov [esi], dl

	call saidaResultado

	mov RAX, SYS_EXIT
	mov RDI, RET_EXIT
	syscall
