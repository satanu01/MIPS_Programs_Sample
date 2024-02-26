.data
    prompt_k: .asciiz "Enter the starting number (K): "
    prompt_n: .asciiz "Enter the number of terms (N): "
    fib_text: .asciiz "Fibonacci Series: "
    space: .asciiz " "
    new_line: .asciiz "\n"

.text
.globl main

main:
    # Print prompt for starting number (K)
    li $v0, 4
    la $a0, prompt_k
    syscall

    # Read starting number (K) from user
    li $v0, 5
    syscall
    move $t0, $v0   # Store starting number (K) in $t0

    # Print prompt for number of terms (N)
    li $v0, 4
    la $a0, prompt_n
    syscall

    # Read number of terms (N) from user
    li $v0, 5
    syscall
    move $t1, $v0   # Store number of terms (N) in $t1

    # Initialize variables
    move $t2, $t0   # First term
    move $t3, $t0   # Second term

    # Print Fibonacci series label
    li $v0, 4
    la $a0, fib_text
    syscall

    # Check if N is greater than or equal to 1
    bgtz $t1, loop

    # If N is 1, print the first term and exit
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit program
    li $v0, 10
    syscall

loop:
    # Print space
    li $v0, 4
     	la $a0, space
syscall

      # Print current term
      li $v0, 1
      move $a0, $t2
      syscall

      # Calculate next term
      add $t4, $t2, $t3   # $t4 = $t2 + $t3
      move $t2, $t3       # $t2 = $t3
      move $t3, $t4       # $t3 = $t4

      # Decrement number of terms
      addi $t1, $t1, -1

      # Check if more terms to calculate
      bgtz $t1, loop

# Exit program
end:
# Print newline
      li $v0, 4
      la $a0, new_line
      syscall

      # Exit
      li $v0, 10
      syscall

