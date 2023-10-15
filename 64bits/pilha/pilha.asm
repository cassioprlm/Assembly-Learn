segment .data ;segment é uma parte do código

        LF              equ 0xA ; Line Feed
        NULL            equ 0xD ; Fim da string

        ; RAX
        SYS_EXIT        equ 60  ; Chamada para finalizar
        SYS_WRITE       equ 1   ; Escrita em x64 bits
        SYS_READ        equ 0   ; Operacao de leitura
        ; RDI
        EXIT_SUCESS        equ 0x0 ; Operacao finalizada com sucesso
        STDOUT_FILENO   equ 1   ; Saida STDOUT
        STDIN           equ 0   ; Entrada STDIN


	; Pilha de Livros
	liv1 db "1. As Cronicas de Narnia", LF, NULL
	liv2 db "2. Harry Potter", LF, NULL
	liv3 db "3. Senhor dos Aneis", LF, NULL

section .text

global _start

_start:
	; Coloca os livros na pilha
	push liv1
	push liv2
	push liv3
	; Pega um livro da Pilha
	pop RDI
	call _imprimir
	pop RDI
	call _imprimir
	pop RDI
	call _imprimir

	; Finalizar
	mov RAX, SYS_EXIT
	mov RBX, EXIT_SUCESS
	syscall

_imprimir:
	call	_ctCaracteres
	mov	RAX, SYS_WRITE
	mov	RSI, RDI ;Move o conteudo do livro pra RSI
	mov	RDI, STDOUT_FILENO
	syscall
	ret

;Conta os caracteres
_ctCaracteres:
	mov RBX, RDI
	mov RDX, 0
loop:
	cmp	byte[RBX], NULL ;Compara os caracteres ate chegar no nulo
	je	finaliza ;Pula para o fim
	inc 	RDX ;Incrementa RDX
	inc 	RBX ;Incrementa RBX
	jmp	loop

finaliza:
	ret











	


