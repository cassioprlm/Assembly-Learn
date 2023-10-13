segment .data ;segment é uma parte do código

        LF              equ 0xA ; Line Feed
        NULL            equ 0xD ; Fim da string

        ; RAX
        SYS_EXIT        equ 60  ; Chamada para finalizar
        SYS_WRITE       equ 1   ; Escrita em x64 bits
        SYS_READ        equ 0   ; Operacao de leitura
        ; RDI
        RET_EXIT        equ 0x0 ; Operacao finalizada com sucesso
        STDOUT_FILENO   equ 1   ; Saida STDOUT
        STDIN           equ 0   ; Entrada STDIN

section .data
	x dd 10001 ;dd = define double word
	y dd 10000 ;dd = define double word
	msg1 db "X maior que Y", LF, NULL
	len1 equ $- msg1
	msg2 db "Y maior que X", LF, NULL
	len2 equ $- msg2

section .text

global _start

_start:
	mov EAX, [x] ; RAX = 61
	mov EBX, [y] ; RDI = 60
	;if
	cmp EAX, EBX
	jg maior ; RAX > RDI
	jl menor ; RAX < RDI

igual:
	jmp final

maior:
	mov RSI, msg1
	mov RDX, len1
	jmp final
menor:
	mov RSI, msg2
	mov RDX, len2
	jmp final
final:
	mov RAX, SYS_WRITE
	mov RDI, STDOUT_FILENO
	syscall

	mov RAX, SYS_EXIT
	mov RDI, RET_EXIT
	syscall




