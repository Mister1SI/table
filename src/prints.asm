section .text
global prints

prints:
	
	push rax
	push rdi
	push rdx
	push r10

	mov rax, 1
	mov rdi, 1
	mov rdx, 1

	.prints_loop:
	
		movzx r10, byte [rsi]
		test r10, r10
		jz .prints_done
		syscall
		inc rsi
		jmp .prints_loop

	.prints_done:

		pop r10
		pop rdx
		pop rdi
		pop rax
		ret

