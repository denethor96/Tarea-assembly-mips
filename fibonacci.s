.data
ingresar: .asciiz "\nque termino de la serie de fibonacci quierecalcular? \n" 
respuesta: .asciiz "\nEl numero que usted busca es:\n"

.text
main:
	li $t0 1 # a
	li $t1 0 # b
	li $t8 0 # contador
	li $t9 0 # aux
	

	la $a0, ingresar
	li $v0, 4
	syscall# imprime el texto de data ingresar
	li $v0, 5
	syscall # lee el valor n
	move $t2, $v0 # guarda en el temoral t2

	if1:
		beq $t8, $t2, final	# si contador == i => final
		add $t9, $t0, $t1	# aux = a+b 
		move $t0, $t1		# a = b
		move $t1, $t9		# b = aux
		add $t8, $t8, 1		# contador++
		j if1				# => if1


	final:
		la $a0, respuesta 
		li $v0, 4
		syscall# imprime el texto de data respuesta
		move $a0, $t1
		li $v0, 1
		syscall # imprime el valor de fibonacci
		li $v0, 10
		syscall # termina
