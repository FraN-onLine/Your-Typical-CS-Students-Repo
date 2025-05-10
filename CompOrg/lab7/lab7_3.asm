# 3. Write a function that prints an array of n integers. The function print must receive two
# arguments: $a0 = address of the array, and $a1 = number n of elements to print. 

.data
    arr: .word 10, 20, 30, 40, 50
    newline: .asciiz "\n"
    msg:    .asciiz "Array contents:\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, msg
    syscall

    la $a0, arr
    li $a1, 5
    jal print

    li $v0, 10
    syscall

# print($a0 = address, $a1 = count)
print:
    li $t0, 0
    move $t2, $a0  # copy of array pointer 
printloop:
    beq $t0, $a1, done
    lw $t1, 0($t2)
    
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    addi $t2, $t2, 4       # move to next element
    addi $t0, $t0, 1
    j printloop
done:
    jr $ra
