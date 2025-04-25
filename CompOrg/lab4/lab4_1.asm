 # Write a program that asks the user to enter an integer and then displays the number of 1's in thebinary representation of that integer. For example, if the user enters 9, then the program should display 2. 
.data
prompt: .asciiz "Enter an integer: "
result: .asciiz "Number of 1s in it's binary form: : "
newline: .asciiz "\n"
    
.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Store input in $t0
    
    li $t1, 0       # counts 1s
loop:
    beqz $t0, fin  # If the number is equal to  zero, go to fin
    andi $t2, $t0, 1  # check the last bit using bitwise and ( 1 because of annulment property (isolates the last bit) and identity property (will be whatever the last bit is because x and 1 is x)
    add $t1, $t1, $t2  # Add to counter
    srl $t0, $t0, 1  # Shift right
    j loop
fin:
    li $v0, 4 #print and exit statements
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10  # Exit
    syscall
