# 5. Suppose we rewrite function f (Figures 7.6) to have an integer parameter n. The local array is 
# now declared to have n integers (rather than 10). This means that the size of the stack frame size 
# of function f will depend on n. Rewrite the function f in MIPS assembly language. Hint: you 
# may use the $fp register (in addition to $sp) to implement the function f. 

 .data
    newline: .asciiz "\n"
    prompt:  .asciiz "Enter 10 integers:\n"
    result:  .asciiz "Reversed array:\n"

.text
.globl main

main:
    jal f  # Call f
    li $v0, 10       # Exit
    syscall

f:
    addiu $sp, $sp, -44      # allocate 44 bytes (10 ints + space for $ra)
    sw $ra, 40($sp)   # save return address at offset 40

    li $v0, 4
    la $a0, prompt
    syscall

    move $a0, $sp  # array address
    li $a1, 10 # number of elements
    jal read # call read($a0, $a1)

    move $a0, $sp
    li $a1, 10
    jal reverse # call reverse($a0, $a1)

    li $v0, 4
    la $a0, result
    syscall

    move $a0, $sp
    li $a1, 10
    jal print  # call print($a0, $a1)

    lw $ra, 40($sp)          # restore return address
    addiu $sp, $sp, 44       # deallocate stack frame
    jr $ra

read:
    li $t0, 0
    move $t2, $a0
read_loop:
    beq $t0, $a1, read_done
    li $v0, 5
    syscall
    sw $v0, 0($t2)
    addi $t2, $t2, 4
    addi $t0, $t0, 1
    j read_loop
read_done:
    jr $ra

reverse:
    move $t0, $a0
    move $t1, $a0
    addi $t2, $a1, -1
    sll $t2, $t2, 2
    add $t1, $t1, $t2
reverse_loop:
    bge $t0, $t1, reverse_done
    lw $t3, 0($t0)
    lw $t4, 0($t1)
    sw $t4, 0($t0)
    sw $t3, 0($t1)
    addi $t0, $t0, 4
    addi $t1, $t1, -4
    j reverse_loop
reverse_done:
    jr $ra

print:
    li $t0, 0
    move $t2, $a0
print_loop:
    beq $t0, $a1, print_done
    lw $t1, 0($t2)
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    addi $t2, $t2, 4
    addi $t0, $t0, 1
    j print_loop
print_done:
    jr $ra

