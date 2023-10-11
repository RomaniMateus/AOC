    .data
result:  .asciiz " valores positivos"

    .text
    .globl main

main:
    # Initialize variables
    li $t1, 0           # Counter for read values
    li $t2, 0           # Counter for positive values

input_loop:
    # Read an integer from the user
    li $v0, 5
    syscall 
    move $t0, $v0
    
    # Increment the total values counter
    addi $t1, $t1, 1

    # Check if the value read is positive
    bgt $t0, 0, increment_positive
    
    bgt $t1, 5, print_positive

    j input_loop

    
increment_positive:
    addi $t2, $t2, 1

    j input_loop

print_positive:

    # Print the number of positives read
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, result
    syscall
    
    exit_program

exit_program:
    # Exit the program
    li $v0, 10
    syscall
