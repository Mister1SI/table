section .data
	msg db "Hello", 10, 0



section .text
global _start
extern prints

_start:
	mov rsi, msg
	call prints

	mov rax, 60
	mov rdi, 12
	syscall

