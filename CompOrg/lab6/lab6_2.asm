#2. Write MIPS code to perform the following integer divisions. What is the value of the LO and HI
#registers?
#a) 98765 / 54321 using the divu instruction
#b) -98765 / -54321 using the div instruction

.data
.text
.globl main
main:
    li $t0, 98765
    li $t1, 54321
    divu $t0, $t1 # unsigned multiplication
    mflo $t2  # result is 0x00000001 (1), the quotient
    mfhi $t3 # result is 0x0000ad9c (44444), the remainder



    li $t4 -98765
    li $t5, -54321
    div $t4 $t5 # signed multiplication
    mflo $t6 #same as above,  result is  0x00000001  (1), the quotient
    mfhi $t7 # inverse of above, result is 0xffff5264  (-44444), the remainder
