.data
    str1:          .asciiz "Enter an Integer value: "  # Prompt message for integer input
    str2:          .asciiz "Doubled Amount:  "        # Message before displaying doubled value
    promptrepeat:  .asciiz "\nRepeat [y/n]? "         # Prompt for repeating

.text
    .globl main

main:
repeat:
    # Print message to ask for an integer
    li $v0, 4          # Load syscall for printing a string
    la $a0, str1       # Load address of prompt message
    syscall            # Print prompt message

    # Read integer input
    li $v0, 5          # Load syscall for reading an integer
    syscall            # Read integer input
    move $s0, $v0      # Store input in $s0

    # Double the input value using add instruction
    add $s0, $s0, $s0  # $s0 = $s0 + $s0 (doubles the value)

    # Print the message "Doubled Amount: "
    li $v0, 4
    la $a0, str2
    syscall

    # Print the doubled value
    li $v0, 1
    move $a0, $s0
    syscall

    # Ask user if they want to repeat
    li $v0, 4
    la $a0, promptrepeat
    syscall

    # Read character input ('y' or 'n')
    li $v0, 12  # Load syscall for reading a character
    syscall
    move $t0, $v0  # Store input character in $t0

    # Compare if input is 'y' to repeat the program
    li $t1, 'y'     # Load ASCII value of 'y' into $t1
    beq $t0, $t1, repeat  # If user entered 'y', repeat

    # Exit the program
    li $v0, 10
    syscall
