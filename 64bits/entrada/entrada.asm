segment .data ;segment é uma parte do código

	LF		equ 0xA ; Line Feed
	NULL 		equ 0xD ; Fim da string

	; RAX
	SYS_EXIT 	equ 60	; Chamada para finalizar
	SYS_WRITE 	equ 1   ; Escrita em x64 bits
	SYS_READ	equ 0 	; Operacao de leitura
	; RDI
	RET_EXIT	equ 0x0	; Operacao finalizada com sucesso
	STDOUT_FILENO	equ 1	; Saida STDOUT
	STDIN		equ 0	; Entrada STDIN
section .data
	msg db "Message: "
	len equ $- msg	

section .bss
	nome resb 10

section .text

global _start

_start:
	
	mov RAX, SYS_WRITE
	mov RDI, STDOUT_FILENO
	mov RSI, msg
	mov RDX, len
	syscall

	mov RAX, SYS_READ
	mov RDI, STDIN
	mov RSI, nome 
	mov RDX, 0xA
	syscall

	mov RAX, SYS_WRITE
	mov RDI, STDOUT_FILENO
	mov RSI, nome
	mov RDX, 0xA
	syscall	

	; finaliza o programa
	mov RAX, SYS_EXIT
	mov RDI, RET_EXIT
	syscall
	
