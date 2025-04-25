# . The string-to-integer program presented in Section 6.5 converts a string of decimal digits to an
#unsigned integer using successive multiplications by 10 and additions. It is also possible to
#convert a string of digits in any radix system to an integer, using successive multiplications by
#the radix value and additions. Rewrite the string-to-integer program asking the user to input a radix value between 2 and 10 and a string of digits in the specified radix system. For example,
#if the radix value is 8 then the string can only have octal digit characters from '0' to '7'.
#Convert the string of digit characters into an unsigned integer and display the value of the
#unsigned integer.

.data
prompt1:   .asciiz "Enter radix (2-10): "
prompt2:  .asciiz "Enter number string in that radix: "
errordigit:      .asciiz "Error: invalid digit for the radix.\n"
errorradix:      .asciiz "Error: invali radix (1-10).\n"
result:     .asciiz "Converted unsigned integer: "
newline:        .asciiz "\n"
input:         .space 32   # buffer for string input

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5 
    syscall
    move $t1, $v0  # $t1 = radix
    
    bgt $t1, 10, invalidradix
    blt $t1, 2, invalidradix

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 8
    la $a0, input
    li $a1, 32
    syscall

    la $t0, input # $t0 = pointer to string
    li $t2, 0 # $t2 = result = 0

convertloop:
    lb $t3, 0($t0)     # load byte (char) -> starts from the top
    beqz $t3, endconvert  # end of string
    beq $t3, 10, endconvert  # newline

    # Convert to ASCII
    li $t4, 48
    sub $t5, $t3, $t4   # $t5 = digit

    # Validate digit: 0 <= digit < radix
    blt $t5, $zero, invaliddigit
    bge $t5, $t1, invaliddigit

    # result = result * radix + digit
    mul $t2, $t2, $t1
    add $t2, $t2, $t5

    addi $t0, $t0, 1
    j convertloop

invaliddigit:
    li $v0, 4
    la $a0, errordigit
    syscall

    li $v0, 10
    syscall
    
 invalidradix:
    li $v0, 4
    la $a0, errorradix
    syscall

    li $v0, 10
    syscall

endconvert:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
