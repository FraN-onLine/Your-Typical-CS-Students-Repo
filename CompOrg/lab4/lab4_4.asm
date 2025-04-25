# Write a program that asks the user to enter a positive integer number n and then prints the nth number in the Fibonacci sequence.
.data
prompt1: .asciiz "Enter the nth Fibonacci number you want to get (n > 0): "
prompt2: .asciiz "warning! n > 0\n"
result: .asciiz "nth Fibonacci number is: : "
    
.text
.globl main

j main #start at main
error: #if number is negative
    li $v0, 4
    la $a0, prompt2
    syscall
main:
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  #gets the digit u want to get
    blez $t0, error #restarts when lower si n2

    li $t1, 0  # Fib0 = 0
    li $t2, 1  # Fib1 = 1
    li $t3, 2  # i = 2
    
    beq $t0, 1, fib1 #if n == 1
    
    
loop: #loops til i == n digit
    move $t4,  $t1 # temp = fib0
    move $t1, $t2 #fib0 = fib1
    add $t2, $t4, $t2 #fib1 = temp + fib1
    addi $t3, $t3, 1
    bne $t3, $t0, loop  # Repeat until counter == n
    
  
    j print

fib1:
    move $t2, $t1 
    j print
 

print:
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
   
    li $v0, 10
    syscall

