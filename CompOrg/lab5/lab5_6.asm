#Write a MIPS program to copy an input text file into an output file. The input and output file names should be entered by the user. If the input file cannot be opened, print an error message. 
.data
prompt1:    .asciiz "Enter input filename: "
prompt2:   .asciiz "Enter output filename: "
error:     .asciiz "Error: cannot open input file.\n"
buffer:  .space 1 
infile:  .space 100
outfile: .space 100

#NOTE, .txt file must either be absolute file or it checks on desktop, not on the same folder
.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 8
    la $a0, infile
    li $a1, 100
    syscall
   
   jal stripnewline
   
    # Open input file (read only is $a1 = 0)
    li $v0, 13
    la $a0, infile
    li $a1, 0
    syscall
    bltz $v0, openerror #negative if error
    move $s0, $v0  # $s0 = input file descriptor

    # Prompt for output filename
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 8
    la $a0, outfile
    li $a1, 100
    syscall

    jal stripnewline
    # Open output file (1 to create and write)
    li $v0, 13
    la $a0, outfile
    li $a1, 1  #write (create if doesn't exist)
    syscall
    move $s1, $v0   # $s1 = output file descriptor


loop:
    # Read one byte from input
    li $v0, 14
    move $a0, $s0
    la $a1, buffer
    li $a2, 1
    syscall
    blez $v0, closefiles  # 0 = End of file(EOF)

    # Write one byte to output
    li $v0, 15
    move $a0, $s1
    la $a1, buffer
    li $a2, 1
    syscall

    j loop

openerror:
    li $v0, 4
    la $a0, error
    syscall
    li $v0, 10
    syscall

closefiles:
    # Close input file
    li $v0, 16
    move $a0, $s0
    syscall

    # Close output file
    li $v0, 16
    move $a0, $s1
    syscall

    # Exit
    li $v0, 10
    syscall
    
    
  #strips \n  
 stripnewline:
    move $t0, $a0  # $t0 is a pointer into the string
loop_strip:
    lb $t1, 0($t0)         # Load byte at current position into $t1
    beqz $t1, donestrip    # If it's the null terminator, we're done
    li $t2, 10             # ASCII code for newline = 10
    beq $t1, $t2, replacenewline
    addi $t0, $t0, 1       # Move to next character
    j loop_strip
    
replacenewline:
    sb $zero, 0($t0)       # Replace '\n' with '\0'
donestrip:
    jr $ra                 # Return from subroutine