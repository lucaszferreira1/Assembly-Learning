	.text
	.globl main

main:
	li $s1 0 # Soma
	li $s2 0 # Cont
	
while:
	li $v0 5
	syscall 
	move $s0, $v0 # lê int
	
	add $s1, $s0, $s1 # add int na soma
	addi $s2, $s2, 1 # add 1 na cont

	bne $s0, -1, while
end:
	addi $s1, $s1, 1
	addi $s2, $s2, -1
	
	li $v0, 1
	move $a0, $s1
    	syscall
    	
    	li $v0, 1
	move $a0, $s2
    	syscall
    	
	li $v0, 10
	syscall
