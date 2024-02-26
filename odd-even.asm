.data
prompt: .asciiz "Enter a number: "
result_even: .asciiz "The number is even."
result_odd: .asciiz "The number is odd."

.text
.globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input number
    li $v0, 5
    syscall
    move $t0, $v0  # Save input number in $t0

    # Check if number is even or odd
    andi $t1, $t0, 1  # Perform bitwise AND with 1 to check the least significant bit
    beqz $t1, even    # If the result is zero, the number is even
    j odd             # Otherwise, jump to odd

even:
    # Print "The number is even."
    li $v0, 4
    la $a0, result_even
    syscall
    j exit

odd:
    # Print "The number is odd."
    li $v0, 4
    la $a0, result_odd
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall

