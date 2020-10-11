global _start

section .data

message: db "hello, world", 10

section .text

_start:
	mov rax, 1 ;número da chamada do sistema armazenado em rax(esse caso 1 para stdout)
	mov rdi, 1 ;onde escrever (descritor)
	mov rsi, message; onde começa a string
	mov rdx, 14; quantos bytes devem ser escritos
        syscall    ; chamada do sistema
        
        mov rax, 60
        mov rdi, 0
        syscall
