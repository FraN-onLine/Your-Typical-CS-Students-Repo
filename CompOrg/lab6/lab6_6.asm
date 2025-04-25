# Fraction computation: Using successive integer multiplications and divisions, write a MIPS 
#program that divides an integer x by another integer y that are read as input. The result of the 
#division should be in the form: a.b, where a is the integer part and b is the fractional part. 
# Compute the fraction b with 8 digits after the decimal point. Display the result in the form a.b. 

.data
prompt1:        .asciiz "Enter numerator (x): "
prompt2:        .asciiz "Enter denominator (y): "
msgresult:      .asciiz "Result: "
newline:        .asciiz "\n"

.text
.globl main
main:
    li $v0, 4  
    la $a0, prompt1
    syscall

    li $v0, 5   
    syscall
    move $t0, $v0 # $t0 = x

    li $v0, 4  
    la $a0, prompt2
    syscall

    li $v0, 5   
    syscall
    move $t1, $v0  # $t1 = y

    div $t0, $t1 # divide x / y
    mflo $t2   # $t2 = integer part a
    mfhi $t3  # $t3 = remainder

    li $v0, 4   # print result message
    la $a0, msgresult
    syscall

    li $v0, 1  # print integer part a
    move $a0, $t2
    syscall

    li $v0, 11 # print '.'
    li $a0, '.'
    syscall

    li $t4, 8   # loop counter for 8 digits
    li $t5, 10   # multiplier = 10 to extract each of the 8 places
fractionloop:
    beqz $t4, done

    mul $t3, $t3, $t5   # remainder *= 10
    div $t3, $t1  # divide by denominator
    mflo $t6 # get next digit
    mfhi $t3  #update remainder

    addi $t6, $t6, 48  # convert digit to ascii
    li $v0, 11 # print char
    move $a0, $t6
    syscall

    subi $t4, $t4, 1  # decrease loop count
    j fractionloop

done:
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10 
    syscall
