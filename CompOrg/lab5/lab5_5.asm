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
    mul $t1, $t0, $t0 #size = n*n*4
    mul $t1, $t1, 4 #size = n*n*4
    
    move $a0, $t1 # $a0 = number of bytes to allocate , being n*n*4
    li $v0, 9 # system call 9 
    syscall # allocate 100 bytes on the heap 
    move $t2, $v0 # $t2 = address of block 
    
    li $t3, 0 #i
    li $t4, 0 #j
    
fori:
	forj:
	#$t2 + ($t3×$t0 + $t4) × 4
	#a[i][j]
	mul $t5, $t3, $t0 #i*n
	add $t5, $t5, $t4 #i*n+j
	mul $t5, $t5, 4 #offset
	add $t5, $t2, $t5 #final
	
	add $t6, $t3, $t4 #i+j
	# if i > 0: a[i][j] += a[i-1][j]
   	 bgtz $t3, add_upper
 condition1end:
    	# if j > 0: a[i][j] += a[i][j-1]
    	bgtz $t4, add_left
condition2end:
	sw  $t6, 0($t5)
	li $v0, 1
	lw $a0, 0($t5)
	syscall

	li $v0, 4
	la $a0, space
	syscall

	addi $t4, $t4, 1
	blt $t4, $t0, forj
	j foriend

add_upper:
    # addr_upper = base + (((i-1) * n + j) * 4)
    addi $t7, $t3, -1 #i-1
    mul $t8, $t7, $t0
    add $t8, $t8, $t4
    mul $t8, $t8, 4
    add $t8, $t2, $t8
    lw $t9, 0($t8)
    add $t6, $t6, $t9
    j condition1end

add_left:
    # addr_left = base + ((i * n + (j-1)) * 4)
    addi $t7, $t4, -1 #j-1
    mul $t8, $t3, $t0
    add $t8, $t8, $t7
    mul $t8, $t8, 4
    add $t8, $t2, $t8
    lw $t9, 0($t8)
    add $t6, $t6, $t9
    j condition2end
    
 foriend:

li $v0, 4
la $a0, newline
syscall
    
addi $t3, $t3, 1
li $t4, 0 #reset j to 0
blt $t3, $t0, fori





