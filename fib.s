	.text
	.globl main
main:
	li $v0 5 # lê int
	syscall
	move $a0, $v0
	
	bnez $a0, chamada
	li $s0, 1
	j end
chamada:
	li $s0, 1
	jal fibonacci
end:
	li $v0, 1 #imprime digitos
	move $a0, $s0
    	syscall
    	
	li $v0, 10
	syscall
	
fibonacci:
	beqz $a0, fib_parada
	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	addi $a0, $a0, -1 # desincrementa 1 de a0
	add $s0, $s0, $a1 # adiciona anterior à soma atual
	la $a2, ($s0) # carrega s0 em a2
	sub $a2, $s0, $a1 # subtrai a1 de s0 e carrega em a2
	la $a1, ($a2) # carrega a2 em a1
	jal fibonacci
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra
	
fib_parada:
	jr $ra
