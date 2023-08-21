.text
.globl main
main:
	li $v0 5 # lê int
	syscall
	move $a0, $v0
	
	jal digitos
end:
	li $v0, 1 #imprime digitos
	move $a0, $s0
    	syscall
    	
	li $v0, 10
	syscall


digitos:
	li $t1, 10
	li $s0, 0
	cal:
	div $a0, $a0, $t1
	addi $s0, $s0, 1
	bge $a0, 1, cal
	jr $ra
