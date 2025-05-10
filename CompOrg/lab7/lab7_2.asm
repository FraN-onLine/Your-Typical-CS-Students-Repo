# 2. Write a function that reads an array of n integers. The function read must receive two
# arguments: $a0 = address of the array, and $a1 = number n of elements to read. 

#my understadning dito is kukuha ng elems? 
.data
msg: .asciiz "Enter array element:"
arr:    .space 100   # size of 25, but a1 will be the one to define until how much it will read

.text
.globl main

main:

    la $a0, arr # address of array
    li $a1, 5 # number of elements, edit nalang dto,  since its asking only for the function and not the program hehe
    jal read

    li $v0, 10 #exit
    syscall

# read($a0 = address, $a1 = count)
read:
    li $t0, 0
readloop:
    beq $t0, $a1, done
    
    li $v0, 4
    la $a0, msg
    syscall
    
    li $v0, 5
    syscall
    sw $v0, 0($a0)
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    j readloop
done:
    jr $ra
