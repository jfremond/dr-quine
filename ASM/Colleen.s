; RDI - 1st argument
; RSI - 2nd argument
; RDX - 3rd argument
; RCX - 4th argument
; R8 - 5th argument
; R9 - 6th argument
; Stack - 7th+ arguments (pushed right-to-left)

global	main
extern	printf
section	.text
print: push rbx
	mov	rdi, s
	mov rsi, s
	mov	rdx, 10
	mov	rcx, 34
	call	printf
	pop rbx
	ret
main: push	rbx
	call	print
	pop	rbx
	ret

section	.data
	s	db "global	main%2$cextern	printf%2$csection	.data%2$c	quote	db 34%2$csection	.text%2$cprint:%2$c	lea	rdi, [rel s]%2$c	movzx	rsi, byte [quote]%2$c	mov	rax, 0%2$c	call	printf%2$c	mov	rax, 0%2$c	ret%2$cmain:%2$c	call	print%2$c	ret%2$csection .data%2$cs db %3$c%1$s%3$c%2$c"
	; s: db "global	main%2$csection .data%2$ccode: db %3$c%1$s%3$c%2$c"
	; nl	db 10
	; tab	db 9
	; quote	db 34
	; code: db "; This is my first quine in ASM%2$cglobal _main%2$cextern _printf%2$csection .text%2$cprint:push rbx%2$cmov rdi, code%2$cmov rsi, code%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall _printf%2$cpop rbx%2$cret%2$c_main:push rbx ;always allign the stack to 16%2$ccall print%2$cpop rbx%2$cret%2$csection .data%2$ccode: db %3$c%1$s%3$c%2$c"