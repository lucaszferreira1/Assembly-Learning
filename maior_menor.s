.text
.globl main
main:
	ori $a0, $zero, 20 # argumento x
	ori $a1, $zero, 10 # argumento y
	ori $a2, $zero, 30 # argumento z
	jal maior
	jal menor
end:
	li $v0, 10
	syscall


menor:
	bge $a0, $a1, a1_compme_a2
	bge $a0, $a2, a1_compme_a2
	la $s1, ($a0)
	jr $ra
a1_compme_a2:
	bge $a1, $a2, a2_menor
	la $s1, ($a1)
	jr $ra
a2_menor:
	la $s1, ($a2)
	jr $ra


maior:
	bge $a1, $a0, a1_compma_a2
	bge $a2, $a0, a1_compma_a2
	la $s0, ($a0)
	jr $ra
a1_compma_a2:
	bge $a2, $a1, a2_maior
	la $s0, ($a1)
	jr $ra
a2_maior:
	la $s0, ($a2)
	jr $ra
