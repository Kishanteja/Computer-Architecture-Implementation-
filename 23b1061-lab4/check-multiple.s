.text

main:
li $s0, 2 #example valur
li $s1, 1 #example value
li $s2, 0
blt $s0, $s1, swap

check_s0:
    sub $t0, $s0, $s1
    bge $t0, $0, check_s0_loop
    beq $s0, $0, multiple
    j end

check_s0_loop:
    move $s0, $t0
    beq $s0, $0, multiple
    j check_s0

swap:
    move $t0, $s0
    move $s0, $s1
    move $s1, $t0

check_s1:
    sub $t0, $s0, $s1
    bge $t0, $0, check_s1_loop
    beq $s0, $0, multiple
    j end

check_s1_loop:
     move $s0, $t0
     beq $s0, $0, multiple
     j check_s1 

multiple:
    li $s2, 1

end: