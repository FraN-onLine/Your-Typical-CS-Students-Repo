#6. The function f(n) implemented in problem 5 calls the functions read, reverse, and print 
# implemented in problems 2 to 4. Write a complete program that includes the main function as 
# well as functions f, read, reverse, and print. The main function should call function f 
# twice as: f(5) and f(8). 

.data
    newline: .asciiz "\n"
    prompt:  .asciiz "Enter n integers:\n"
    result:  .asciiz "Reversed array:\n"

.text
.globl main

main:
    li $a0, 5 
    jal f     # Call f(5)
    
    li $a0, 8
    jal f     # Call f(8)
    
    li $v0, 10  # Exit
    syscall


f:
    move $t9, $a0 #save n in $t9
    li $t0, 4
    mul $t1, $t9, $t0 
    addiu $t1, $t1, 4 

    subu $sp, $sp, $t1  #allocate stack frame
    move $s0, $sp #save stack base in $s0
    sw $ra, 0($s0)   #store $ra at lowest address

    li $v0, 4
    la $a0, prompt
    syscall

    addiu $a0, $s0, 4       # $a0 = start of array (after $ra)
    move  $a1, $t9
    jal read

    addiu $a0, $s0, 4
    move  $a1, $t9
    jal reverse

    li $v0, 4
    la $a0, result
    syscall

    addiu $a0, $s0, 4
    move  $a1, $t9
    jal print

    lw $ra, 0($s0)  # Restore $ra
    move $sp, $s0   # Restore original $sp
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

