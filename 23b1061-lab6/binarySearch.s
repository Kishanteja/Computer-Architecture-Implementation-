.data
A: .word 0, 1, 2, 3, 4, 5, 6, 7

.text
.globl main

binarySearch:
    #a0 = A, a1 = len, a2 = start, a3 = end, t0 = val
    addi $sp, $sp, -28
    sw $ra, 24($sp)
    sw $a0, 20($sp)
    sw $a1, 16($sp)
    sw $a2, 12($sp)
    sw $a3, 8($sp)
    sw $t0, 4($sp)

    bgt $a2, $a3, notfound

    add $t1, $a2, $a3
    srl $t1, $t1, 1

    sll $t2, $t1, 2
    add $t2, $t2, $a0
    lw $t3, 0($t2)

    lw $t0, 4($sp)
    beq $t3, $t0, found

    bgt $t3, $t0, search

    addi $a2, $t1, 1
    jal binarySearch
    j endsearch
search:
    addi $a3, $t1, -1
    jal binarySearch
    j endsearch
endsearch:
    lw $ra, 24($sp)
    lw $a0, 20($sp)
    lw $a1, 16($sp)
    lw $a2, 12($sp)
    lw $a3, 8($sp)
    lw $t0, 4($sp)
    addi $sp, $sp, 28
    jr $ra
notfound:
    li $v0, -1
    j endsearch
found:
    move $v0, $t1
    j endsearch
main:
    la $a0, A
    li $a1, 8
    li $a2, 0
    li $a3, 7
    li $v0, 5

    syscall
    move $t0, $v0
    jal binarySearch
    move $a0, $v0

    li $v0, 1
    syscall