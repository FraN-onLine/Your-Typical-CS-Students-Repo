# Write a program that asks the user to enter an integer and then display the hexadecimal representation of that integer. 
#theres another method that uses syscall 34 but parang di aligned to the theme of the lab w/ loops
.data
prompt:   .asciiz "Enter an integer: "
result:  .asciiz "Hexadecimal: 0x"
hexchars: .asciiz "0123456789abcdef"  # Hex values
newline:  .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  #stores the decimal input

    #hex starts with 0x so this prints it
    li $v0, 4
    la $a0, result
    syscall

    #start with left most (7th away from the LSB since 8 hex digits)
    li $t1, 7  
loop:
    srl $t2, $t0, 28 #shift leftmost 4 bits to the rightmost position, starting from the most significant bit (31-28)
    andi $t2, $t2, 0xF  #keeps last 4 again using identity property 

    # Convert to hex character
    la $t3, hexchars #loads the adress of the string
    add $t3, $t3, $t2 #this navigates through the indices, because ex. 0xnnnnnn0 = 0, 0xnnnnnn1 = 1, etc. adding the value results to corresponding hex
    lbu $a0, 0($t3) #loads the byte in the address to $a0 to print
    lbu 

    #print the leftmost 
    li $v0, 11
    syscall

    #shift number left by 4 bits (move next hex digit to front)
    sll $t0, $t0, 4

    subi $t1, $t1, 1 #reduce amount loop by 1
    bgez $t1, loop  # Repeat until all 8 hex digits are printed

    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10  # Exit
    syscall