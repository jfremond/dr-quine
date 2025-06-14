global	main
; Calling external function printf
extern	printf

section	.text
	print:
		push	rbp
		mov	rbp, rsp
		mov	rdi, s
		mov	rsi, s
		mov	rdx, 10
		mov	rcx, 34
		call	printf
		pop	rbp
		ret
	main:
		; Stack alignment before calling the function
		push	rbp
		mov	rbp, rsp
		call	print
		pop	rbp
		mov	rax, 0
		ret

section	.data
	s	db "global	main%2$c; Calling external function printf%2$cextern	printf%2$c%2$csection	.text%2$c	print:%2$c		push	rbp%2$c		mov	rbp, rsp%2$c		mov	rdi, s%2$c		mov	rsi, s%2$c		mov	rdx, 10%2$c		mov	rcx, 34%2$c		call	printf%2$c		pop	rbp%2$c		ret%2$c	main:%2$c		; Stack alignment before calling the function%2$c		push	rbp%2$c		mov	rbp, rsp%2$c		call	print%2$c		pop	rbp%2$c		mov	rax, 0%2$c		ret%2$c%2$csection	.data%2$c	s	db %3$c%1$s%3$c%2$c"
