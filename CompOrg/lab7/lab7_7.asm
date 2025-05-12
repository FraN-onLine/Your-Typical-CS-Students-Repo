#7. The recursive function fib(n) computes the nth element in the Fibonacci sequence. Implement 
#this function in MIPS. Write a main function to call fib. 
#int fib(int n) { 
#  if (n < 2) return n; 
#  return (fib(n-1) + fib(n-2)); 
#}

.data
    prompt:     .asciiz "Enter n for Fibonacci(n): "
    resultMsg:  .asciiz "Fibonacci result: "
    newline:    .asciiz "\n"
    error: .asciiz "Invalid number"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0   # move input n into $a0
    
    blez $a0, errorinput

    jal fib # call fib(n)
    move $t0, $v0   # store result

    li $v0, 4
    la $a0, resultMsg
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

fib:
    addiu $sp, $sp, -12 #allocate stack space
    sw $ra, 8($sp)   # save return address
    sw $a0, 4($sp) # save input n

    li $t1, 2
    blt $a0, $t1, fib_base  # if n < 2, return n

    # Call fib(n-1)
    addi $a0, $a0, -1
    jal fib
    sw $v0, 0($sp) # save fib(n-1) result

    # Call fib(n-2)
    lw $a0, 4($sp)          # restore original n
    addi $a0, $a0, -2
    jal fib

    # Add fib(n-1) + fib(n-2)
    lw $t2, 0($sp)          # get fib(n-1)
    add $v0, $v0, $t2       # $v0 = fib(n-2) + fib(n-1)

    lw $ra, 8($sp)          # restore return address
    addiu $sp, $sp, 12      # deallocate stack
    jr $ra

fib_base:
    move $v0, $a0           # return n
    lw $ra, 8($sp)
    addiu $sp, $sp, 12
    jr $ra
    
errorinput:
    li $v0, 4
    la $a0, error
    syscall


    li $v0, 10
    syscall
    
