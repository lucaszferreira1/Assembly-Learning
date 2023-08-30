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
	add $v0, $v0, $a1 # adiciona anterior à soma atual
	move $t0, $v0 # carrega v0 em t0
	sub $t0, $v0, $a1 # subtrai a1 de v0 e carrega em t0
	move $a1, $t0 # carrega t0 em a1
	jal fibonacci
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra

fib:
	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	addi $a0, $a0, 1
	ori $v0, $zero, 1
	jal fibonacci
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra
