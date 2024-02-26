.data
    series:    .word    1, 1, 2, 3, 5, 0
    msg1: .asciiz    "palindrome"
    msg2: .asciiz    "Not Palindrome"


.text
.globl main
main:
    la $t0, series
    li $t2, 0


loop1:
lw $t1, 0($t0)
      beq $t1, $zero, end
      mul $t2, $t2, 10
   	add $t2, $t2, $t1
      add $t0, $t0, 4
      j loop1
end:
      move $t0, $t2
	li $t3, 0


loop2:
    	mul $t3, $t3, 10
 	rem $t1, $t0, 10
  	div $t0, $t0, 10
 	add $t3, $t3, $t1
  	bne $t0, $zero, loop2
  	bne $t2, $t3, np
 
    	li $v0, 4
    	la $a0, msg1
    	syscall


  	li $v0, 10
    	syscall
    	 
np:
  	li $v0, 4
	la $a0, msg2
      syscall




    	li $v0, 10
    	syscall
