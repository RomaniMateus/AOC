.data
invalid_slug_msg: .asciiz ": valor invalido."
invalid_speed_msg: .asciiz ": velocidade invalida\n"
greatest_number_msg: .asciiz "Maior nivel: velocidade "

.text
.globl main

main:
    # Initialize variables
    li $t1, 0          # Counter for the greatest number
    li $t3, 1          # Current number

    # Getting number of elements from the user
    li $v0, 5
    syscall 
    move $t0, $v0

    blt $t0, 1, invalid_input
    bgt $t0, 30, invalid_input

# Entering loop to get the numbers
input_loop:
    beq $t0, $zero, input_loop_end

    # Decrementing the counter
    sub $t0, $t0, $t3

    # Getting the number from the user
    li $v0, 5
    syscall
    move $t2, $v0

    # Checking if the number is less than 1
    blt $t2, 1, invalid_speed

    # Checking if the number is greater than 50
    bgt $t2, 50, invalid_speed

    # Checking if the number is greater than the current greatest
    bgt $t2, $t1, update_greatest

    # Jumping to the beginning of the loop
    j input_loop

invalid_input:

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, invalid_slug_msg
    syscall
    j exit

invalid_speed:

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, invalid_speed_msg
    syscall

update_greatest:

    move $t1, $t2

    # Jumping to the beginning of the loop
    j input_loop

input_loop_end:
    blt $t1, 10, print_level_1_speed
    blt $t1, 20, print_level_2_speed

    j print_level_3_speed

print_level_1_speed:

    li $v0, 4
    la $a0, greatest_number_msg
    syscall

    li $v0, 1
    li $a0, 1
    syscall
    
    j exit

print_level_2_speed:
    
    li $v0, 4
    la $a0, greatest_number_msg
    syscall

    li $v0, 1
    li $a0, 2
    syscall

    j exit

print_level_3_speed:

    li $v0, 4
    la $a0, greatest_number_msg
    syscall

    li $v0, 1
    li $a0, 3
    syscall

    j exit

exit:
    li $v0, 10
    syscall