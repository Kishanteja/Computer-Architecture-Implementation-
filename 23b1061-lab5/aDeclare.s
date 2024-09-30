.data
.align 3

A:
    .word 0, 0
    .word -1, 2
    .word 0, 2
    .word -1, -1

.text
.globl main

main:
    la $t0, A
    lw $t1, 8($t0)
    lw $t2, 12($t0)
    
    add $t3, $t1, $t2