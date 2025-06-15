global	main
extern	sprintf
extern	dprintf
extern	system
extern	strchr

%macro	OPEN 0
	mov	rax, 2
	lea	rdi, [rel child_filename_buffer]
	mov	rsi, [rel flags]
	mov	rdx, [rel mode]
	syscall
	mov	r12, rax
%endmacro

%macro	CHECK_FILE 0
	push	rbp
	mov	rbp, rsp
	mov	rdi, file
	mov	rsi, 95
	call	strchr wrt ..plt
	pop	rbp
%endmacro

%macro	SPRINTF 2
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rel %1]
	lea	rsi, [rel %2]
	mov	rdx, rbx
	call	sprintf wrt ..plt
	pop	rbp
%endmacro

%macro	WRITE_IN_FILE 0
	push	rbp
	mov	rbp, rsp
	mov	rdi, r12
	mov	rsi, s
	mov	rdx, s
	mov	rcx, 10
	mov	r8, 34
	call	dprintf wrt ..plt
	pop	rbp
%endmacro

%macro	SYSTEM 1
	push	rbp
	mov	rbp, rsp
	mov	rdi, %1
	call	system wrt ..plt
	pop	rbp
%endmacro

section	.text
	main:
		mov	rbx, 5
		cmp rbx, 0
		jle	end
		CHECK_FILE
		cmp rax, 0
		jne decr_i
		SPRINTF	child_filename_buffer, child_filename
		SPRINTF	compile_child_buffer, compile_child
		SPRINTF	exec_child_buffer, exec_child
		OPEN
		WRITE_IN_FILE
		SYSTEM	compile_child_buffer
		SYSTEM	exec_child_buffer
	decr_i:
		dec	rbx
	end:	
		ret

section	.data
	file	db __FILE__, 0
	child_filename	db "Sully_%d.s", 0
	compile_child	db "nasm -f elf64 -g -gdwarf -o Sully_%1$d.o Sully%1$d.s", 0
	exec_child	db "./Sully_%d", 0
	child_filename_buffer	times 64 db 0
	compile_child_buffer	times 128 db 0
	exec_child_buffer	times 64 db 0
	s	db "global	main%2$cextern	sprintf%2$cextern	dprintf%2$cextern	system%2$cextern	strchr%2$c%2$c%%macro	OPEN 0%2$c	mov	rax, 2%2$c	lea	rdi, [rel childname_buffer]%2$c	mov	rsi, [rel flags]%2$c	mov	rdx, [rel mode]%2$c	syscall%2$c	mov	r12, rax%2$c%%endmacro%2$c%2$c%%macro	CHECK_FILE 0%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	mov	rdi, file%2$c	mov	rsi, 95%2$c	call	strchr wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	SPRINTF 2%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	lea	rdi, [rel %%1]%2$c	lea	rsi, [rel %%2]%2$c	mov	rdx, rbx%2$c	call	sprintf wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	WRITE_IN_FILE 0%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	mov	rdi, r12%2$c	mov	rsi, s%2$c	mov	rdx, s%2$c	mov	rcx, 10%2$c	mov	r8, 34%2$c	call	dprintf wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	SYSTEM 1%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	mov	rdi, %%1%2$c	call	system wrt ..plt%2$c	pop	rbp%2$c%%endmacro										%2$c%2$cs	db %3$c%1$s%3$c%2$c", 0
	flags	dq 0x441
	mode	dq 0o600
