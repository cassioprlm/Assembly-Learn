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

	LEN_BUFFER equ 0xA

segment .bss
	BUFFER resb 0x1

segment .text

saidaResultado:
	mov RAX, SYS_WRITE
	mov RDI, STDOUT_FILENO
	mov RSI, BUFFER
	mov RDX, LEN_BUFFER
	syscall
	ret
