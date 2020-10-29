# factorial.asm
# assembler de MIPS, mismo programa que factorial.c

.data
prompt: .asciiz "Ingrese un numero: "

.text
.globl main

main:

li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido

li       $t1, 1         # t1 es el resultado

loop:
beq      $t0, $zero, exit  # salimos del loop si t0 es 0
mul      $t1, $t1, $t0     # res *= n
addi     $t0, $t0, -1      # n--
j        loop              # volvemos a loopear

exit:

li       $v0, 1         # print_int code
move     $a0, $t1       # muevo el resultado a a0 para el print
syscall                 # printf("%d\n", res)

li       $v0, 10        # exit
syscall                 # exit
