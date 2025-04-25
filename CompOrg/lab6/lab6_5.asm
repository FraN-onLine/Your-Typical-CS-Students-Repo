# The integer-to-string program presented in Section 6.5 converts an unsigned integer to string 
#format using successive division by 10 and storing the remainder digit characters in a string. It 
#is also possible to convert the unsigned integer to any radix using successive divisions by the 
#radix value. Rewrite the integer-to-string program asking the user to input an unsigned integer 
#and a radix value between 2 and 10. Do the radix conversion and then print the string. Make 
#sure that the string has sufficient space characters, especially when converting to radix 2. 

.data
prompt1:     .asciiz "Enter an unsigned integer: "
prompt2:   .asciiz "Enter a radix (2 to 10): "
error:      .asciiz "Error: Invalid radix. Must be 2 to 10.\n"
resultmsg:     .asciiz "Converted string: "
newline:        .asciiz "\n"
output:     .space 64       # final converted string
reverse:    .space 64       # buffer to store reverse

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 # $t0 = number to convert

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0 # $t1 = radix

    # Validate radix
    li $t2, 2
    li $t3, 10
    blt $t1, $t2, invalidradix
    bgt $t1, $t3, invalidradix

    # Convert integer to string in given radix
    la $t4, output    # $t4 = utput
    li $t5, 0   # digit counter

    beqz $t0, zero #if input is 0

loop:
    divu $t0, $t1  # divide number by radix
    mfhi $t6   # remainder = digit
    mflo $t0   # quotient =  new number

    addi $t6, $t6, 48   # convert digit to ASCII
    sb $t6, 0($t4)  # store in output in reverse order
    addi $t4, $t4, 1   #goes to next bit
    addi $t5, $t5, 1 #increment counter 
    bnez $t0, loop

    j reversestring #reverses it back to normal

zero:
    li $t6, 48  #the ASCII value of 0
    sb $t6, 0($t4)
    addi $t4, $t4, 1
    li $t5, 1  # digit count = 1

reversestring:
    la $t6, output    # start of original
    la $t7, reverse   # start of reversed

reverseloop:
    beqz $t5, printresult
    addi $t5, $t5, -1 #reduce ciount
    add $t8, $t6, $t5 #get it's adress at output str
    lb $t9, 0($t8) #load then store
    sb $t9, 0($t7)
    addi $t7, $t7, 1 #move 1 bit
    j reverseloop

printresult:
    sb $zero, 0($t7)  

    li $v0, 4
    la $a0, resultmsg
    syscall

    li $v0, 4
    la $a0, reverse
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

invalidradix:
    li $v0, 4
    la $a0, error
    syscall
    li $v0, 10
    syscall
