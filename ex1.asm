.data
    result:  .asciiz "Maior: "


.text
.globl main

main:
    # Input
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0
    
    li $v0, 5
    syscall
    move $t2, $v0

    add $t3, $t0, $t1
    sub $t4, $t0, $t1

    sra $t5, $t4, 31
    xor $t4, $t4, $t5
    sub $t4, $t4, $t5

    add $t6, $t3, $t4
    sra $t7, $t6, 1

    add $t3, $t7, $t2
    sub $t4, $t7, $t2

    sra $t5, $t4, 31
    xor $t4, $t4, $t5
    sub $t4, $t4, $t5

    add $t6, $t3, $t4
    sra $t7, $t6, 1

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t7
    syscall
    
    