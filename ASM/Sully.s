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
	lea	rdi, [rel file]
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
	lea	rsi, [rel s]
	lea	rdx, [rel s]
	mov	rcx, 10
	mov	r8, 34
	mov	r9, rbx
	call	dprintf wrt ..plt
	pop	rbp
%endmacro

%macro	SYSTEM 1
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rel %1]
	call	system wrt ..plt
	pop	rbp
%endmacro

section	.text
	main:
		mov	rbx, 5
	loop_start:
		cmp	rbx, 0
		jl	end
		CHECK_FILE
		cmp	rax, 0
		jne	decr_i
		SPRINTF	child_filename_buffer, child_filename
		SPRINTF	compile_child_buffer, compile_child
		SPRINTF	link_child_buffer, link_child
		SPRINTF	exec_child_buffer, exec_child
		OPEN
		WRITE_IN_FILE
		SYSTEM	create_dir
		SYSTEM	compile_child_buffer
		SYSTEM	link_child_buffer
		SYSTEM	exec_child_buffer
		mov	rax, 3
		mov	rdi, r12
		syscall
	decr_i:
		dec	rbx
		jmp	loop_start
	end:
		ret

section	.data
	file	db __FILE__, 0
	child_filename	db "Sully_%1$d.s", 0
	create_dir	db "mkdir -p objs/", 0
	compile_child	db "nasm -f elf64 -g -gdwarf -o objs/Sully_%1$d.o Sully_%1$d.s", 0
	link_child	db "gcc -Wall -Wextra -Werror objs/Sully_%1$d.o -o Sully_%1$d", 0
	exec_child	db "./Sully_%1$d", 0
	child_filename_buffer	times 64 db 0
	compile_child_buffer	times 128 db 0
	link_child_buffer	times 64 db 0
	exec_child_buffer	times 64 db 0
	s	db "global	main%2$cextern	sprintf%2$cextern	dprintf%2$cextern	system%2$cextern	strchr%2$c%2$c%%macro	OPEN 0%2$c	mov	rax, 2%2$c	lea	rdi, [rel child_filename_buffer]%2$c	mov	rsi, [rel flags]%2$c	mov	rdx, [rel mode]%2$c	syscall%2$c	mov	r12, rax%2$c%%endmacro%2$c%2$c%%macro	CHECK_FILE 0%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	lea	rdi, [rel file]%2$c	mov	rsi, 95%2$c	call	strchr wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	SPRINTF 2%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	lea	rdi, [rel %%1]%2$c	lea	rsi, [rel %%2]%2$c	mov	rdx, rbx%2$c	call	sprintf wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	WRITE_IN_FILE 0%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	mov	rdi, r12%2$c	lea	rsi, [rel s]%2$c	lea	rdx, [rel s]%2$c	mov	rcx, 10%2$c	mov	r8, 34%2$c	mov	r9, rbx%2$c	call	dprintf wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	SYSTEM 1%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	lea	rdi, [rel %%1]%2$c	call	system wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$csection	.text%2$c	main:%2$c		mov	rbx, %4$d%2$c	loop_start:%2$c		cmp	rbx, 0%2$c		jl	end%2$c		CHECK_FILE%2$c		cmp	rax, 0%2$c		jne	decr_i%2$c		SPRINTF	child_filename_buffer, child_filename%2$c		SPRINTF	compile_child_buffer, compile_child%2$c		SPRINTF	link_child_buffer, link_child%2$c		SPRINTF	exec_child_buffer, exec_child%2$c		OPEN%2$c		WRITE_IN_FILE%2$c		SYSTEM	create_dir%2$c		SYSTEM	compile_child_buffer%2$c		SYSTEM	link_child_buffer%2$c		SYSTEM	exec_child_buffer%2$c		mov	rax, 3%2$c		mov	rdi, r12%2$c		syscall%2$c	decr_i:%2$c		dec	rbx%2$c		jmp	loop_start%2$c	end:%2$c		ret%2$c%2$csection	.data%2$c	file	db __FILE__, 0%2$c	child_filename	db %3$cSully_%%1$d.s%3$c, 0%2$c	create_dir	db %3$cmkdir -p objs/%3$c, 0%2$c	compile_child	db %3$cnasm -f elf64 -g -gdwarf -o objs/Sully_%%1$d.o Sully_%%1$d.s%3$c, 0%2$c	link_child	db %3$cgcc -Wall -Wextra -Werror objs/Sully_%%1$d.o -o Sully_%%1$d%3$c, 0%2$c	exec_child	db %3$c./Sully_%%1$d%3$c, 0%2$c	child_filename_buffer	times 64 db 0%2$c	compile_child_buffer	times 128 db 0%2$c	link_child_buffer	times 64 db 0%2$c	exec_child_buffer	times 64 db 0%2$c	s	db %3$c%1$s%3$c, 0%2$c	flags	dq 0x441%2$c	mode	dq 0o600%2$c", 0
	flags	dq 0x441
	mode	dq 0o600
