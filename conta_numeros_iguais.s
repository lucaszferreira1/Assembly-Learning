.text
.globl main
.data
		newline: .asciiz "\n"
.text

main:
	li $v0 5 # lê n
	syscall
	move $a0, $v0
	
	beqz $a0, fim # se n == 0 fim
	
	li $v0 5 # lê k
	syscall
	move $a1, $v0
	
	jal conta
	
	move $s0, $v0
	li $v0, 1 #imprime digitos
	move $a0, $s0
    syscall
    
    li $v0, 4 # imprime nova linha
	la $a0, newline
	syscall
	
	j main

fim:
	li $v0, 10
	syscall


conta_ns:
	bnez $s0, cont1
	jr $ra
cont1:

	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	li $t0, 10
	div $s0, $t0 # divide n / 10
	mfhi $t0 # coloca o resto da divisao em t0
	bne $t0, $s1, cont2 # se o resto da divisao for igual a k
	addi $v0, $v0, 1 # adiciona 1 ao total
cont2:
	sub $s0, $s0, $t0 # retira o resto da divisao de n
	li $t0, 10
	div $s0, $s0, $t0 # divide n por 10
	jal conta_ns
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra

conta:
	addi $sp, $sp, -4 # colocamos o endereço na pilha
	sw $ra, 0($sp)
	
	move $s0, $a0
	move $s1, $a1
	ori $v0, $zero, 0
	jal conta_ns
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 # retiramos o endereço da pilha
	jr $ra
