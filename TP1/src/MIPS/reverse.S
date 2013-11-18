#include <mips/regdef.h>	
	.text
	.align	2
	.globl	reverse

	.ent	reverse
reverse:
	subu	sp, sp, 32
	sw	ra, 24(sp)
	sw	$fp, 20(sp)
	sw	gp, 16(sp)
	
	# a0: infd, input file
	# a1: outfd, output file
	
	# s0: current pos input file
	# s1: current pos output file
	# s2: current value input file
	# s3: buffer size
	# s4: buffer pointer
	# s5: file length
	# s6: character readed
	
	move a0, s0
	move a1, s1
	
	lb	s2,  0(a0)
	
	
readFile:
	li	s3, 30			# InitialBuffer
	addiu t0, s3, 2	# InitialBuffer = InitialBuffer + 2
	move t0, a0
	jal mymalloc
	
	move s4, v0	# Buffer pointer
	move s5, zero	# file length
	lb	s6, 0(s0)	# s6 <- character
	
fileLoop:
	beqz s6, endFile	# eof validation
	
	addiu s5, s5, 1	# Add 1 to lenght
	addiu t0, s5, 1	# t0 <- length + 1
	beq s3, t0, increaseMalloc	# if (length + 1) == bufferSize
	
bufferIncreased:
	addu t0, s4, s5	# t0 = buffer pointer + file length
	subu t0, t0, 1
	sw	t0, 0(s6)		# save character
	
	li t3, 10				# \n ascii value
	beq t1, t3, endFile	# if character == '\n' break
	
	addiu t1, s5, 1	# Add 1 to file pointer
	
	lb	t1,0(s0)	# Read file
	b fileLoop
	
increaseMalloc:
	move t1, s3	# Original length
	addu s3, s3, s3	# InitialBuffer = InitialBuffer * 2
	addiu t0, s3, 2	# InitialBuffer = InitialBuffer + 2
	move t0, a0
	jal mymalloc	# v0 <- new buffer
	
	move t2, zero	# currentPosition = 0

increaseMallocLoop:
	beq t2, t1, endIncrease	# if currentPosition == originalLength
	
	addu t3, s4, t2
	lb t4, 0(t3)	# load character at old buffer
	
	addu t3, v0, t2
	sw t4, 0(t3)	# Save character at new buffer
	
	addiu t2, t2, 1
	
	b increaseMallocLoop
	
	
endIncrease:
	move s4, v0	# old buffer = new buffer
	b bufferIncreased
	
	
endFile:

	
	lw		ra, 24(sp)
	lw		$fp, 20(sp)
	lw		gp, 16(sp)
	addiu	sp, sp, 32
.end reverse

