.data
str1: .asciiz "Please enter a number: "
str2: .asciiz "The result is: "
true_string: .asciiz "Prime\n"
false_string: .asciiz "Composite\n"
other_string: .asciiz "Neither\n"

.text

main:
	# print message
	la $a0, str1
	li $v0, 4
	syscall
	
	# take input
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal isPrime # call isPrime
	
	# save result
	move $s0, $v0
	
	# print message
	la $a0, str2
	li $v0, 4
	syscall
	
	# print result
	move $a0, $s0
	li $v0, 4
	syscall
	
	j end

isPrime:
	# can be more efficient with a sqrt calculation, but that's effort
	
	# prologue
	addi $sp, $sp, -8
	sw $s0, 0($sp) # the main code doesn't use $s0 until after this, but gotta have clean code
	sw $s1, 4($sp)
	
	# $s0 = backup of input (dividend), $s1 = divisor
	move $s0, $a0 # no real point but whatever
	
	ble $s0, 1, result_other # check <= 1
	beq $s0, 2, result_prime # check 2
	beq $s0, 3, result_prime # check 3
	
	and $t0, $s0, 1 # check if multiple of 2
	beq $t0, $0, result_notprime
	
	# start the actually important part of the algorithm
	addi $s1, $0, 3
	isPrime_loop:
		bge $s1, $s0, result_prime
		
		div $s0, $s1
		mfhi $t0
		beq $t0, $0, result_notprime
		
		addi $s1, $s1, 2
		j isPrime_loop
	
	# return values
	result_prime:
	la $v0, true_string
	j isPrime_end
	
	result_notprime:
	la $v0, false_string
	j isPrime_end
	
	result_other:
	la $v0, other_string
	
	isPrime_end:
	# epilogue
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra

end:
	li $v0, 10 # terminate
	syscall