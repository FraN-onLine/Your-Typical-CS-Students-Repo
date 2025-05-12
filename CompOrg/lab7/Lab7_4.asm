# 4. Write a function that reverses the elements of an array of n integers. The function reverse 
# must receive two arguments: $a0 = address of the array, and $a1 = number n of elements. 

.data
    arr: .word 1, 2, 3, 4, 232
    newline: .asciiz "\n"
    msg1: .asciiz "Before reverse:\n"
    msg2: .asciiz "After reverse:\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall

    la $a0, arr
    li $a1, 5
    jal print

    la $a0, arr
    li $a1, 5
    jal reverse

    li $v0, 4
    la $a0, msg2
    syscall

    la $a0, arr
    li $a1, 5
    jal print

    li $v0, 10
    syscall

print:
    li $t0, 0
    move $t9, $a0
print_loop:
    beq $t0, $a1, done
    lw $t1, 0($t9)
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    addi $t9, $t9, 4
    addi $t0, $t0, 1
    j print_loop
done:
    jr $ra

reverse:
    move $t0, $a0
    move $t1, $a0
    addi $t2, $a1, -1
    sll $t2, $t2, 2
    add $t1, $t1, $t2
rev_loop:
    bge $t0, $t1, rev_done
    lw $t3, 0($t0)
    lw $t4, 0($t1)
    sw $t4, 0($t0)
    sw $t3, 0($t1)
    addi $t0, $t0, 4
    addi $t1, $t1, -4
    j rev_loop
rev_done:
    jr $ra
