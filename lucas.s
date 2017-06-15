.data
ingresar: .asciiz "\nque termino de la serie de lucas quiere calcular? \n" 
respuesta: .asciiz "\nEl resultados es:\n"

.text
main:
	li $t0 2 # a
	li $t1 1 # b
	li $t3 0 # suma
	li $t8 1 # contador
	li $t9 0 # aux

	la $a0, ingresar
	li $v0, 4
	syscall# imprime el texto de data ingresar
	li $v0, 5
	syscall # lee el valor n
	move $t2, $v0 # guarda en el temoral t2

	if1:
		slt $t7, $t2, 1		# si n < 1 => 1 sino 0
		beq $t7, 1, final	# si n < 1 salta a final
		sub $t2, $t2, 1		# n = n-1

	if2:
		li $t3 2			# suma = 2
		beqz $t2, final		# si n == 0 salta a finak
		li $t3 3			# suma = 3
		beq $t2, 1, final	# si n == 1 salta a final
	
	loop:
		beq $t8, $t2, final	# si contador == n salta a final
		add $t9, $t0, $t1	# aux = a+b 
		move $t0, $t1		# a = b
		move $t1, $t9		# b = aux
		add $t3, $t3, $t9	# suma = suma + aux
		add $t8, $t8, 1		# contador++
		j loop				# salta a loop

	final:
		la $a0, respuesta 
		li $v0, 4
		syscall# imprime el texto de data respuesta
		move $a0, $t3
		li $v0, 1
		syscall # imprime el valor de la suma de lucas hasta n
		li $v0, 10
		syscall # termina