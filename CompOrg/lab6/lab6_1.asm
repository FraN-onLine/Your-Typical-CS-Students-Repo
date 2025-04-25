#Write MIPS code to perform the following integer multiplications. What is the value of the LO
# and HI registers?
# a) 98765 × 54321 using the multu instruction
# b) -98765 × -54321 using the mult instruction 

.data
.text
.globl main
main:
    li $t0, 98765
    li $t1, 54321
    multu $t0, $t1 # unsigned multiplication
    mflo $t2  # result is 0xFEA29F91 (1070046269), the lower 32 of the 64 bit product
    mfhi $t3 # result is 0x1 (1), the upper 32 of the 64 bit product, so 1 is the 33rd bit from the right



    li $t4 -98765
    li $t5, -54321
    mult $t4 $t5 # signed multiplication
    mflo $t6 #same as above,  result is 0xFEA29F91 (1070046269), the lower 32 of the 64 bit product
    mfhi $t7 # same as above, result is 0x1 (1), the upper 32 of the 64 bit product
