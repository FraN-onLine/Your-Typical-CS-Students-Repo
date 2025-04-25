.data
    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    equal_msg: .asciiz "equal\n"
    not_equal_msg: .asciiz "not equal\n"

.text
    .globl main

main:
  
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  
  
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  
    
    beq $t0, $t1, print_equal
    j print_not_equal

print_equal:
    li $v0, 4
    la $a0, equal_msg
    syscall
    j exit

print_not_equal:
    li $v0, 4
    la $a0, not_equal_msg
    syscall

exit:
    li $v0, 10
    syscall
