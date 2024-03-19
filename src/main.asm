section .text
global _start
extern prints

_start:
	
	; Get argc and print help if it's only 1
	pop rdi
	pop rsi
	mov qword [argc], rdi
	mov qword [argv], rsi
	cmp rdi, 1
	je .print_help

	mov rdi, [argc]
	cmp rdi, 2
	jl .bad
	; Print the first argument
	mov rbx, [argv]		; Get the pointer to the first string
	mov rsi, [rsi]		; Get the start of the first string
	call prints
	jmp .exit

	.bad:
	mov rsi, less
	call prints
	jmp .exit

	.print_help:
	mov rsi, help_text
	call prints
	jmp .exit

	.exit:
	mov rax, 60
	mov rdi, 0
	syscall

section .bss
	argc resq 1
	argv resq 1

section .data
	help_text db "table: file preprocessor", 10, "usage:", 10, 9, "table <file>", 10, 0
	less db "Less than! Oh no!", 10, 0

