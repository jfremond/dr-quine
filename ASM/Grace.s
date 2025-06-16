global	main
extern	dprintf

section	.data
	filename	db "Grace_kid.s", 0
	s	db "global	main%2$cextern	dprintf%2$c%2$csection	.data%2$c	filename	db %3$cGrace_kid.s%3$c, 0%2$c	s	db %3$c%1$s%3$c, 0%2$c	flags	dq 0x441%2$c	mode	dq 0o600%2$c%2$c%%macro	OPEN 0%2$c	mov	rax, 2%2$c	lea	rdi, [rel filename]%2$c	mov	rsi, [rel flags]%2$c	mov	rdx, [rel mode]%2$c	syscall%2$c	mov	r12, rax%2$c%%endmacro%2$c%2$c%%macro	WRITE 0%2$c	push	rbp%2$c	mov	rbp, rsp%2$c	mov	rdi, r12%2$c	lea	rsi, [rel s]%2$c	lea	rdx, [rel s]%2$c	mov	rcx, 10%2$c	mov	r8, 34%2$c	call	dprintf wrt ..plt%2$c	pop	rbp%2$c%%endmacro%2$c%2$c%%macro	RUN 0%2$c	section	.text%2$c	main:%2$c		OPEN%2$c		WRITE%2$c		mov	rax, 3%2$c		mov	rdi, r12%2$c		syscall%2$c	ret%2$c%%endmacro%2$c%2$c; Run the program here%2$cRUN%2$c", 0
	flags	dq 0x441
	mode	dq 0o600

%macro	OPEN 0
	mov	rax, 2
	lea	rdi, [rel filename]
	mov	rsi, [rel flags]
	mov	rdx, [rel mode]
	syscall
	mov	r12, rax
%endmacro

%macro	WRITE 0
	push	rbp
	mov	rbp, rsp
	mov	rdi, r12
	lea	rsi, [rel s]
	lea	rdx, [rel s]
	mov	rcx, 10
	mov	r8, 34
	call	dprintf wrt ..plt
	pop	rbp
%endmacro

%macro	RUN 0
	section	.text
	main:
		OPEN
		WRITE
		mov	rax, 3
		mov	rdi, r12
		syscall
	ret
%endmacro

; Run the program here
RUN
