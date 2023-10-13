section .data
	msg db "Hello World!", 0xA
	tam equ $- msg
section .text

global _start

_start:

	mov EAX, 0x4
	mov EBX, 0x1
	mov ECX, msg
	mov EDX, tam
	int 0x80	


	; syntax "mov" = dest, origin
	mov EAX, 0x1 ; Terminar o programa
	mov EBX, 0x0 ; Valor de retorno é 0
	int 0x80
	
	
