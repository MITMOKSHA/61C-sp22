.globl factorial

.data
n: .word 8

.text
main:
    la t0, n            # load address of data 8 to to reg.
    lw a0, 0(t0)        # load the data to a0(the first param).

    jal ra, factorial   # jump to factorial func and save return addr into ra.
	
    addi a1, a0, 0      # read the factorial outcome to a1.
	# x0 always contain value 0.
    addi a0, x0, 1      # if a0 equals to 1, print the number in a1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10    # if a0 equals to 0, halt the program.
    ecall # Exit

factorial:
    # YOUR CODE HERE
	addi sp, sp, -12
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw t0, 8(sp)
	add s0, x0, a0   # n
	addi s1, x0, 1   # initialize product
	addi t0, x0, 1   # base case
loop:
	beq s0, t0, exit # while the n equals to 1, return.
	mul s1, s1, s0   # product *= n
	addi s0, s0, -1  # n -= 1
	jal x0, loop 
exit:
	addi ra, s1, 0   # return value
	lw s0, 0(sp)
	lw s0, 4(sp)
	lw t0, 8(sp)
	addi sp, sp, 8
	jr ra
	
