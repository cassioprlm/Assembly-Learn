section .data

	msg db "Hello World", 0xA
	tam equ $- msg

section .text

global _start

_start:
	
	mov RAX, 1
	mov RDI, 1 
	mov RSI, msg
	mov RDX, tam
	syscall

	mov RAX, 60
	mov RDI, 0
	syscall
