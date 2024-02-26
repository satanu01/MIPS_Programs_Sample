.data
num:    .word    28
factor:    .word    0, 0, 0, 0, 0, 0, 0, 0, 0
newline:	.asciiz "\n"

.text
.globl main
main:
    la $t0, num
    lw $t1, 0($t0)
    
    la $t5, factor

    li $t2, 0
    li $t3, 0    # counter.

loop:
    addi $t2, $t2, 1    
    rem $t4, $t1, $t2
    bne $t4, $zero, loop
    beq $t1, $t2, end
    addi $t3, $t3, 1
    sw $t2, 0($t5)
    addi $t5, $t5, 4
    move $a0, $t2
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    bgt $t1, $t2, loop
    
end:
    li $v0, 10
    syscall

