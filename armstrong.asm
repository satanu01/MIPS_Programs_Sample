.data
    num: .word 153   	# Enter the number to check.
    msg1: .asciiz "Armstrong number\n"
    msg2: .asciiz "Not an Armstrong number\n"


.text
.globl main
main:
    la $t0, num  	# Load the address of the number.
    lw $t1, 0($t0)  	# Load the number into $t1.	[$t1: Actual Number]
    move $t0, $t1   	# Copy the number to $t0.

    li $t2, 0    # Count the no of digit.   [$t2: Digit Count]
loop:    
    div $t0, $t0, 10
    addi $t2, $t2, 1
    bne $t0, $zero, loop

    li $t4, 0    # Final number will be store in [$t4].    
    move $t0, $t1    # Again copy the number.

outloop:    
    rem $t5, $t0, 10    # Get the first number.
    li $t6, 1    # Intermediate multiplication result will store.
    move $t3, $t2    # Copy the counter.

inloop:    
    mul $t6, $t6, $t5    # Multiply each times.
    addi $t3, $t3, -1    # Decrement counter.
    bne $t3, $zero, inloop    # Continue multiplication using counter.

    add $t4, $t4, $t6    # Add intermediate result to [$t4].
    div $t0, $t0, 10    # Reduce number.
    bne $t0, $zero, outloop    # Continue for each digit.
    
    bne $t4, $t1, negetive
    li $v0, 4    # Print "Armstrong".
    la $a0, msg1
    syscall
    j end

negetive:    
    li $v0, 4    # Print "Not Armstrong".
    la $a0, msg2
    syscall

end:
    li $v0, 10    	# Exit the program.
    syscall

