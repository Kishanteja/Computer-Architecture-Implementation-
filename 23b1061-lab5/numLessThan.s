.data
    prompt1:	.asciiz "Enter the real part: "
    prompt2:	.asciiz "Enter the imaginary part: "
    result:	.asciiz "the answer is: "
    newline: .asciiz	"\n"

elt:
    .space 8

.align 2
A:
    .word 0, 0
    .word -1, 2
    .word 0, 2
    .word -1, -1

.text
.globl main

isLessThan:
    # a0 = e1, a1 = e2, v0 = return
    lw $t0, 0($a0)
    lw $t1, 4($a0)
    lw $t2, 0($a1)
    lw $t3, 4($a1)
    blt $t0, $t2, lessthan
    bne $t0, $t2, greaterthan
    blt $t1, $t3, lessthan
lessthan:
    li $v0, 1
    jr $ra
greaterthan:
    li $v0, 0
    jr $ra

numLessThan:
    # t0 = count, a0 = elt, a1 = array[i], a2 = start, a3 = end
    li $t0, 0
    move $t1, $a2
loop:
    bge $t1, $a3, loopcompleted
    sll $t2, $t1, 3
    add $t3, $a1, $t2
    move $a1, $t3
    jal isLessThan
    beq $v0, 1, increase
    j next
next:
    addi $t1, $t1, 1
loopcompleted:
    move $v0, $t0
    jr $ra
increase:
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j loop

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    la $t2, elt
    sw $v0, 0($t2)

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    sw $v0, 4($t2)

    la $a0, elt
    la $a1, A
    li $a2, 0
    li $a3, 4
    jal numLessThan
    
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall