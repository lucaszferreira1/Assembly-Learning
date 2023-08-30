	.text
	.globl main
main:
	li $v0, 5 # lê int
	syscall
	move $a0, $v0
	
	bnez $a0, chamada
	li $v0, 1
	j end
chamada:
	jal fib
end:
	move $s0, $v0
	li $v0, 1 #imprime digitos
	move $a0, $s0
    	syscall
    	
	li $v0, 10
	syscall

fibonacci:
	bgt $a0, 1, conti
	jr $ra
conti:	
	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	addi $a0, $a0, -1 # desincrementa 1 de a0
	add $v0, $a1, $a2 # adiciona anterior à soma atual
	move $a2, $a1
	move $a1, $v0
	
	
	jal fibonacci
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra

fib:
	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	li $a1, 1
	addi $a0, $a0, 1
	ori $v0, $zero, 1
	jal fibonacci
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra
