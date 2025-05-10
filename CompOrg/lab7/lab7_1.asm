# 1. The function islower, shown in Figure 7.1, tests whether a character ch is lowercase or not.
# Write the main function of a program that reads a character ch, calls the function islower,
# and then prints a message to indicate whether ch is a lowercase character or not. 
.data
    msg: .asciiz "Enter a character: "
    yes:  .asciiz "\nLowercase letter\n"
    no:   .asciiz "\nNot a lowercase letter\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall

    li   $v0, 12  
    syscall
    move $a0, $v0

    jal  islower

    beq  $v0, 1, printyes #if 1 loads yesmsg else no
    la   $a0, no
    j    printmsg

printyes:
    la   $a0, yes

printmsg:
    li   $v0, 4
    syscall
    li   $v0, 10 #exit
    syscall

islower:
    blt  $a0, 'a' , else
    bgt  $a0,  'z'  , else
    li   $v0, 1
    jr   $ra

else:
    li   $v0, 0
    jr   $ra
