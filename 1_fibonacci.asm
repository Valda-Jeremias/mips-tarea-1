# fibonacci.asm
# assembler de MIPS, mismo programa que fibonacci.c

# Registros
# t0 -> a
# t1 -> b
# t2 -> c
# t3 -> i (contador del for)

.data
nl: .asciiz "\n"     # caracter de nueva linea

.text
.globl main

main:

li      $t0, 0          # cargamos 0 en t0
li      $t1, 1          # cargamos 1 en t1

li      $v0, 1
move    $a0, $t0
syscall                 # imprime t0

li      $v0, 4
la      $a0, nl
syscall                 # imprime \n

li      $v0, 1
move    $a0, $t1
syscall                 # imprime t1

li      $v0, 4
la      $a0, nl
syscall                 # imprime \n


li      $t3, 18         # cargamos 18 en i
loop:
# salimos del loop cuando t3 llegue a 0
beq     $t3, $zero, exit
# codigo del loop
add     $t2, $t0, $t1   # c = a + b
# imprimir c
li      $v0, 1
move    $a0, $t2
syscall                 # imprime t2
# imprimimos el \n
li      $v0, 4
la      $a0, nl
syscall                 # imprime \n
move    $t0, $t1        # a = b
move    $t1, $t2        # b = c

# decrementar el contador
addi    $t3, $t3, -1

j       loop            # arranca el loop de vuelta

exit:
li      $v0, 10         # exit code
syscall                 # exit
