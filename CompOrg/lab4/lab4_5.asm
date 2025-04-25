# Write a program that asks the user to enter two positive numbers a and b and outputs thegreatest common divisor of the two numbers by implementing the given algorithm. If the user enters a=48 and b=18, your program should output the gcd as 6. 
.data
prompt1: .asciiz "Enter first positive number (a): "
prompt2: .asciiz "Enter second positive number (b): "
prompt3: .asciiz "warning! a, b > 0\n"
result: .asciiz "Greatest Common Divisior,  gcd(a, b): "

.text
.globl main

j main
error:
    li $v0, 4
    la $a0, prompt3
    syscall
main:
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # a = $t0
    
   
    li $v0, 4
    la $a0, prompt2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0  # b = $t1
    
    # both > 0
    blez $t0, error
    blez $t1, error
    
    # d = 0
    li $t2, 0  # d = $t2

    #while both a and b are even
loopeven:
    andi $t3, $t0, 1  #check if a is even, this is because in binary, numbers that are even end with 0, and using bitwise and with 1 will result with x's lsb (identity)
    andi $t4, $t1, 1  #check if b is even
    or $t5, $t3, $t4  #if either is odd, break
    bne $t5, $zero, loopunequal
    
    srl $t0, $t0, 1  # a = a / 2
    srl $t1, $t1, 1  # b = b / 2
    addi $t2, $t2, 1  # d = d + 1
    j loopeven

loopunequal: # a != b
    beq $t0, $t1, g #terminate loop if equal
    
    andi $t3, $t0, 1  #check if a is even
    beqz $t3, dividea
    
    andi $t4, $t1, 1  #check if b is even
    beqz $t4, divideb
    
    bgt $t0, $t1, subtractab #(a>b) else
    sub $t1, $t1, $t0
    srl $t1, $t1, 1 #shifting by 1 will divide it by 2 in binary
    j loopunequal

subtractab:
    sub $t0, $t0, $t1
    srl $t0, $t0, 1
    j loopunequal

dividea:
    srl $t0, $t0, 1
    j loopunequal

divideb:
    srl $t1, $t1, 1
    j loopunequal

g:
    move $t3, $t0  # g = a
    li $t4, 1 # initialize 2^d as 1
    move $t5, $t2  # copy d to $t5

looppower:
    beqz $t5, print #if d == 0, go to print
    sll $t4, $t4, 1  # multiply by 2 (shift left, because binary is powers of 2 as is
    sub $t5, $t5, 1  # decrement d
    j looppower
    
print:

    mul $t3, $t3, $t4  # gcd = g * 2^d

    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
exit:
    li $v0, 10
    syscall

