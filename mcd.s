.data
numero1: .asciiz "\nIngrese el primer numero \n"
numero2: .asciiz "\nIngrese el segundo numero \n"
respuesta: .asciiz "\nEl MCD es:\n"

.text
main:
	li $t0 0 #resultado	

	la $a0, numero1
	li $v0, 4
	syscall# imprime el texto de data numero1
	li $v0, 5
	syscall #lee el valor n
	move $t1, $v0 #lo pone en un registro

	la $a0, numero2
	li $v0, 4
	syscall# imprime el texto de data numero2
	li $v0, 5
	syscall #lee el valor n
	move $t2, $v0 #lo pone en un registro

	if1:
		slt $t8, $t1, $t2	# t1 < t2 == 1 si no 0
		beqz $t8, if2		# si t8 es 0 salta a if2
		move $t3, $t1		# carga en t3 el valor de t1
		move $t1, $t2		# carga en t1 el valor de t2
		move $t2, $t3		# carga en t2 el valor de t3
		
	if2:
		rem $t0,$t1,$t2 # guarda en t0 el resto de dividir t1 en t2
		bne $t0, $zero, change #si no es 0 manda al while
		j final	# salta a final

	change:
		move $t1,$t2	# carga en t1 el valor de t2
		move $t2,$t0	# carga en t2 el valor de t0
		j if2			# salta a if2

	final:
		la $a0, respuesta 
		li $v0, 4
		syscall # imprime el texto de data respuesta
		move $a0, $t2
		li $v0, 1
		syscall # imprime el valor del mcd
		li $v0, 10
		syscall #termina
