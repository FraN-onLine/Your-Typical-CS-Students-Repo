#Write a MIPS program that allocates an n×n array of integers on the heap, where n is a user 
#input. The program should compute and print the value of each element as follows: 
#for (i=0; i<n; i++) 
#for (j=0; j<n; j++) { 
#a[i][j] = i+j; 
#if (i>0) a[i][j] = a[i][j] + a[i-1][j]; 
#if (j>0) a[i][j] = a[i][j] + a[i][j-1]; 
#print_int(a[i][j]); 
#print_char(' '); 
#} 
#rint_char('\n'); 
#} 

.data
prompt: .asciiz "Enter a number(n) for the nxn array: "
res: .asciiz "result: "
newline:  .asciiz "\n"
space: .asciiz " "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Store input in $t0, #n
    mul $t1, $t0, 4 #size
    
    move $a0, $t1 # $a0 = number of bytes to allocate 
    li $v0, 9 # system call 9 
    syscall # allocate 100 bytes on the heap 
    move $t2, $v0 # $t2 = address of block 
    
    li $t3, 0 #i
    li $t4, 0 #j
    
fori:
	forj:
	#$t2 + ($t3×$t0 + $t4) × 4
	#a[i][j]
	mul $t5, $t3, $t0
	add $t5, $t5, $t4
	mul $t5, $t5, 4
	add $t5, $t2, $t5
	
	add $t6, $3, $t4 #i+j
	sw  $t2, 0($t5)
	
	li $v0, 1
	move $a0, $t5
	syscall

	li $v0, 4
	la $a0, space
	syscall

	addi $t4, $t4, 1
	blt $t4, $t0, forj


li $v0, 4
la $a0, newline
syscall
    
addi $t3, $t3, 1
li $t4, 0 #reset j to 0
blt $t3, $t0, fori








