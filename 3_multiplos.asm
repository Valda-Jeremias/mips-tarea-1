.data
nl: .asciiz "\n"

.text
.globl main

# s0 -> i (el contador)
# s1 -> 101
# s2 -> el resultado de i % 3
main:

li $s0, 1    # int i = 1
li $s1, 101  # el valor 101 para salir del loop

loop:
beq $s0, $s1, exit

### CHEQUEAMOS QUE S0 sea divisible por 3
rem $s2, $s0, 3   # resto3 = i % 3
beq $s2, $zero, print   # if (i % 3 == 0)
### CHEQUEAMOS QUE S0 sea divisible por 5
rem $s2, $s0, 5   # resto5 = i % 5
beq $s2, $zero, print   # if (i % 5 == 0)

j endprint

print:
# IMPRIMIR EL VALOR DE S0 y una \n ####   printf("%d\n", i);
li $v0, 1
move $a0, $s0
syscall
li $v0, 4
la $a0, nl
syscall
#######################################   printf("%d\n", i);

endprint:
addi $s0, $s0, 1   # i++ (add inmediato )
j loop

exit:
li $v0, 10
syscall      # salimos del programa cuando  termina el loop
