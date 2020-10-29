# multiplos.asm
# assembler de MIPS, mismo programa que multiplos.c

.data
nl: .asciiz "\n"     # caracter de nueva linea

.text
.globl main

# --- Registros ---
# s0 -> i (el contador)
# s1 -> 101
# s2 -> el resultado de i % 3 o i % 5

main:
li       $s0, 1              # int i = 1
li       $s1, 101            # el valor 101 para salir del loop
loop:
beq      $s0, $s1, exit      # si i == 101 goto exit
rem      $s2, $s0, 3         # resto3 = i % 3
beq      $s2, $zero, print   # if (i % 3 == 0) goto print
rem      $s2, $s0, 5         # resto5 = i % 5
beq      $s2, $zero, print   # if (i % 5 == 0) goto print
j        endprint            # si no es multiplo saltear print
print:
li       $v0, 1              # print_int code
move     $a0, $s0            # s0 es el numero
syscall                      # imprime el numero
li       $v0, 4              # print_str code
la       $a0, nl             #
syscall                      # printf("\n")
endprint:
addi     $s0, $s0, 1         # i++
j        loop                # volver a loopear
exit:
li       $v0, 10             # syscall exit code
syscall                      # exit
