	.text
	.globl main

main:
	li $s0 1
	
	li $v0 5
	syscall
	move $s1, $v0
	
	
while:
	mult $s1, $s0
	mflo $s0
	addi $s1, $s1, -1
	bnez $s1, while
end:
	li $v0, 1
	move $a0, $s0
    	syscall
    
	li $v0, 10
	syscall
