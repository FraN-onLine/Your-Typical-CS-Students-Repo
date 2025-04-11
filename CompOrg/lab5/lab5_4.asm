# Write a MIPS program that defines a one-dimensional array of 10 integers in the static area of the data segment, asks the user to input all 10 array elements, computes, and displays their sum.
.data
ints: .space 40
prompt: .asciiz "Enter a number: "
res: .asciiz "result: "

.text
.globl main

main:
    li $t0, 0 #counter
    la $t1, ints #integers
    li $t2, 0 #sum

loop:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t3, $v0  # Store input in $t3
    
    sw	$t3, 0($t1) #store
    addi $t0, $t0, 1 #i++
    add $t1, $t1, 4 #shift 4 for each int
    blt $t0, 10, loop
    
    li $t0, 0 #counter
    la $t1, ints #integers
    
sumcalc:
    lbu	$t3, 0($t1) #load
    addi $t0, $t0, 1 #i++
    add $t1, $t1, 4 #shift 4 for each int
    add $t2, $t2, $t3
    blt $t0, 10, sumcalc
    
    li $v0, 4
    la $a0, res
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    