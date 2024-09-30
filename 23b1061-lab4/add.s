# .text

# main:
#    li $t0, 1
#    li $t1, 2
#    add $t2, $t0, $t1

.text

main:
    lui $t0, 0x2000
    ori $t0, $t0, 0x0001

    lui $t1, 0x1000
    ori $t1, $t1, 0x0002

    add $t2, $t0, $t1