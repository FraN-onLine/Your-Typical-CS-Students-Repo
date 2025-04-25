.data
    .data
    prompt: .asciiz "Enter your name: "
    hello: .asciiz "Hello "
    name: .space 100  

 .globl main
 .text

main:
 
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 8
    la $a0, name
    li $a1, 100 
    syscall

    li $v0, 4
    la $a0, hello
    syscall

    li $v0, 4
    la $a0, name
    syscall

    li $v0, 10
    syscall
