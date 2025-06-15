; global	main
; extern	sprintf
; ; extern	dprintf
; extern	printf
; extern	system
; extern	strchr
; ; nasm -f elf64 -g -gdwarf -o Sully_%1$d.o Sully%1$d.s

; %macro	PRINTF 1
; 	push	rbp
; 	mov	rbp, rsp
; 	lea	rdi, [rel fmt]
; 	lea	rsi, [rel %1]
; 	call	printf wrt ..plt
; 	pop	rbp
; %endmacro

; section	.data
; 	file	db __FILE__, 0
; 	child_file	db "Sully_%d.s", 10, 0
; 	s	db "prout", 0
; 	fmt	db "%s", 0
; 	cmd	db "nasm -f elf64 -g -gdwarf -o Sully_%1$d.o Sully_%1$d.s", 10, 0

; section	.text
; 	main:
; 		; init i et check sa valeur
; 		mov	rbx, 5
; 		cmp	rbx, 0
; 		jle	end
; 		; strchr(const char *s, int c)
; 		push	rbp
; 		mov	rbp, rsp
; 		mov	rsi, file
; 		mov	rdi, "_"
; 		call	strchr wrt ..plt
; 		cmp	rax, 0
; 		pop	rbp
; 		jne	decr_i
; 		; creer nom fichier enfant
; 		; sprintf(char *str, format, arg)
; 		push	rbp
; 		mov	rbp, rsp
; 		lea	rdi, [rel fmt]
; 		lea	rsi, [rel child_file]
; 		mov	rdx, rbx
; 		call	sprintf wrt ..plt
; 		pop	rbp

; 		PRINTF
; 		; creer commande creation executable
; 		; sprintf(char *str, format, arg)
; 		push	rbp
; 		mov	rbp, rsp
; 		lea	rdi, [rel fmt]
; 		lea	rsi, [rel cmd]
; 		mov	rdx, rbx
; 		call	sprintf wrt ..plt
; 		pop	rbp
; 		PRINTF 
; 		; creer commande exec
; 		; open fichier enfant open(filename, flags, mode)
; 		; print dans fichier enfant
; 		; dprintf(fd, format, args)
; 		; fermer fichier
; 		; exec compilation
; 		; exec lancer execution
; 		; push	rbp
; 		; mov	rbp, rsp
; 		; pop	rbp
; 		ret
	
; 	decr_i:
; 		dec rbx
; 	end:
; 		ret
