#Write a program that asks the user to enter two integers: n1 and n2 and prints the sum of all numbers from n1 to n2. For example, if the user enters n1=3 and n2=7, then the program should display the sum as 25.
    .data
prompt1: .asciiz "Enter n1 (lower limit): "
prompt2: .asciiz "Enter n2 (upper limit): "
prompt3: .asciiz "warning! n1 <= n2 \n"
result: .asciiz "The result of the summation of i, as i goes from n1 to n2 is: "
    
.text
.globl main

j main #start at main
error: #jumped to if n1 is greater than n2
    li $v0, 4
    la $a0, prompt3
    syscall
main:
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  #gets the lower value

    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  #gets the higher value
    
    blt $t1, $t0, error #restarts when lower si n2
	
    move $t2, $t0  # storage of the sum, start w lower limit
loop:
    beq  $t0, $t1, done #if its equal to the last element
    add $t0, $t0, 1 #increment lower value
    add $t2, $t2, $t0 #add it
    j loop
done:
    li $v0, 4 #print and exit statements
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10  # Exit
    syscall
