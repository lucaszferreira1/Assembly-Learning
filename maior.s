.text
.globl main
main:
	ori $a0, $zero, 10 # argumento x
	ori $a1, $zero, 20 # argumento y
	jal maior_menor
end:
	li $v0, 10
	syscall
	

maior_menor:
	bge $a0, $a1, a0_maior
	la $s0, ($a1)
	jr $ra
a0_maior:
	la $s0, ($a0)
	jr $ra
