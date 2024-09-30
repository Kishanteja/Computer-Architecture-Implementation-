factorial:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    bne $a0, $zero, else
    addi $v0, $zero, 1
    j exit
else:
    addi $a0, $a0, -1
    jal factorial
    lw $a0, 0($sp)
    mul $v0, $v0, $a0
exit:
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
main:
    li $a0, 3
    jal factorial
    move $a0, $v0
    li $v0, 1
    syscall