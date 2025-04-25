#Factorial Calculation: Using the mul instruction, write a MIPS program that computes the factorial of a number n input by the user, and display the result on the screen. Run your code and record the maximum 32-bit factorial value that can be computed without errors. 

.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Factorial: "
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5 #reead int
    syscall
    move $t0, $v0  # n

    li $t1, 1 # result = 1
    li $t2, 1 # counter = 1, start factorial from 1


loop:
    ble $t0, $t2, lastfactorial
    mul $t1, $t1, $t2
    addi $t2, $t2, 1
    j loop

lastfactorial:
    mul $t1, $t1, $t2  # include last multiplication

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
