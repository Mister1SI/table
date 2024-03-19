section .text
global _start
extern prints

_start:
	
	; Get argc and print help if it's only 1
	mov rdi, [rsp + 8]
	mov rsi, [rsp + 16]
	mov [argc], rdi
	mov [argv], rsi
	cmp rdi, 1
	je .print_help

	; Print the first argument
	mov rbx, [argv]		; Get the pointer to the first string
	mov rsi, [rbx]		; Get the start of the first string
	mov rsi, [rsi]
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
	help_text db "table: file preprocessor", 10, "usage:", 10, "table <file>", 10, 0

