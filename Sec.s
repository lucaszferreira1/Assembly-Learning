	.text
	.globl main

	.data
		newline: .asciiz "\n"
		error: .asciiz "ERRO"
	.text

main:
	li $s1 0 # Soma
	li $s2 0 # Cont
	
while:
	li $v0 5 # lê int
	syscall
	move $s0, $v0
	
	add $s1, $s0, $s1 # add int na soma
	add $s2, $s2, 1 # add 1 na cont

	bne $s0, -1, while
end:
	addi $s1, $s1, 1 # add 1 na soma 
	addi $s2, $s2, -1 # remove 1 da cont
	
	li $v0, 1
	move $a0, $s1
    	syscall
    	
    	li $v0, 4 # imprime nova linha
	la $a0, newline
	syscall
	
	beqz $s1, erro # se soma = 0 print erro
	
     	div $s2, $s1, $s2 # senão print calc media
    	li $v0, 1 #imprime media
	move $a0, $s2
    	syscall
    	
    	j fim
    	
erro:
	li $v0, 4
	la $a0, error
	syscall

fim:
	li $v0, 10
	syscall
    
	
