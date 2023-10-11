    .data
odd:  .asciiz " valor(es) impar(es)\n"
even: .asciiz " valor(es) par(es)\n"
positive:  .asciiz " valor(es) positivo(s)\n"
negative:  .asciiz " valor(es) negativo(s)\n"

    .text
    .globl main

main:
    # Initialize variables
    li $t1, 0           # Counter for read values
    li $t2, 0           # Counter for positive values
    li $t3, 0           # Counter for negative values
    li $t4, 0           # Counter for even values
    li $t5, 0           # Counter for odd values
    li $t6, 0           # Register for the number 2

input_loop:
    beq $t1, 5, print_positive

    addi $t1, $t1, 1

    li $v0, 5
    syscall 
    move $t0, $v0
    
    bgt $t0, 0, increment_positive
    
    j increment_negative


    j input_loop

    
increment_positive:
    # Increment the positive values counter
    addi $t2, $t2, 1 

    # Check if the value is even
    andi $t0, $t0, 0x0001
    beq $t0, 0, increment_even

    # Increment the odd values counter
    addi $t5, $t5, 1

    j input_loop

increment_even:
    
    # Increment the even values counter
    addi $t4, $t4, 1

    j input_loop

increment_negative:
    
    # Increment the negative values counter
    addi $t3, $t3, 1

    # Check if the value is even
    andi $t0 , $t0 , 0x0001
    beq $t0, 0, increment_even

    # Increment the odd values counter
    addi $t5, $t5, 1

    j input_loop

print_positive:

    # Print the number of even values read
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, even
    syscall
    
    # Print the number of odd values read
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, odd
    syscall

    # Print the number of positives read
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, positive
    syscall

    # Print the number of negatives read
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, negative
    syscall

    j exit_program

exit_program:
    # Exit the program
    li $v0, 10
    syscall
