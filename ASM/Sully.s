global	main
extern	sprintf
extern	dprintf
extern	printf
extern	system
extern	strchr

%macro	PRINT_STR 1 ; give buffer to print
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rel string]
	lea	rsi, [rel %1]
	call	printf wrt ..plt
	pop	rbp
%endmacro

%macro	PRINT_NUM 1 ; give number to print
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rel num]
	lea	rsi, [rel %1]
	call	printf wrt ..plt
	pop	rbp
%endmacro

section	.data
	string	db "%s", 10, 0
	num	db "%d", 10, 0
	file	db __FILE__, 0	; name of the current file
	child_file_format	db "Sully_%d.s", 0	; name of child
	child_file_buffer	times 64 db 0	; buffer to write child filename
	comp_cmd_format	db "nasm -f elf64 -g -gdwarf -o Sully_%1$d.o Sully%1$d.s", 0 ; command to compile child file
	comp_cmd_buffer	times 128 db 0	; buffer to write compilation command
	exec_cmd_format	db "./Sully_%d", 0	; command to execute child file
	exec_cmd_buffer	times 64 db 0 ; buffer to write exec child file command
	s	db "prout%2$ccaca%2$cs	db %3$c%1$s%3$c%2$c", 0	; what to print in child file
	flags	dq 0x441
	mode	dq 0o600

section	.text
	main:
		; init i and check value
		mov	rbx, 5
		PRINT_NUM rbx
		; check if current file is child file or no
			; decrement i if yes
		cmp rbx, 0
		jle decr_i
		; create child filename sprintf(char, str, args)
		push	rbp
 		mov	rbp, rsp
		lea	rdi, [rel child_file_buffer]
		lea	rsi, [rel child_file_format]
		mov	rdx, rbx
		call sprintf wrt ..plt
 		pop	rbp
		PRINT_STR child_file_buffer
		; create comp child file cmd sprintf(char, str, args)
		push	rbp
 		mov	rbp, rsp
		lea	rdi, [rel comp_cmd_buffer]
		lea	rsi, [rel comp_cmd_format]
		mov	rdx, rbx
		call sprintf wrt ..plt
 		pop	rbp
		PRINT_STR comp_cmd_buffer
		; create exec child file cmd sprintf(char, str, args)
		push	rbp
 		mov	rbp, rsp
		lea	rdi, [rel exec_cmd_buffer]
		lea	rsi, [rel exec_cmd_format]
		mov	rdx, rbx
		call sprintf wrt ..plt
 		pop	rbp
		PRINT_STR exec_cmd_buffer
		; open child file open(filename, flags, mode)
		mov	rax, 2
		lea	rdi, [rel child_file_buffer]
		mov	rsi, [rel flags]
		mov	rdx, [rel mode]
		syscall
		mov	r12, rax
		; write in child file dprintf(fd, str, args)
		push	rbp
		mov	rbp, rsp
		mov	rdi, r12
		mov	rsi, s
		mov	rdx, s
		mov	rcx, 10
		mov	r8, 34
		call	dprintf wrt ..plt
		pop	rbp
		; exec comp child file system(buf)
		; push	rbp
 		; mov	rbp, rsp
 		; pop	rbp
		; exec exec child file system(buf)
		; push	rbp
 		; mov	rbp, rsp
 		; pop	rbp
	ret

	decr_i:
		dec	rbx
