#include <sys/syscall.h>
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
	
	move s0, a0			# Save input file
	move s1, a1			# Save output file
	

readFile:
	li	s3, 30			# InitialBuffer
	addiu t0, s3, 2		# InitialBuffer = InitialBuffer + 2
	move t0, a0
	jal mymalloc
	
	move s4, v0			# Buffer pointer
	move s5, zero		# file length

	li v0, SYS_read	# system call for write to read
	move a0, s0			# file descriptor
	move a1, s6			# s6 <- character
	li a2, 1			# read 1 byte
	syscall				# read file
	bltz v0, read_error
	
fileLoop:
	lb t0, 0(s6)		# Load character value
	beqz t0, endFile	# eof validation
	
	addiu s5, s5, 1		# Add 1 to lenght
	addiu t0, s5, 1		# t0 <- length + 1
	beq s3, t0, increaseMalloc	# if (length + 1) == bufferSize
	
continueLoop:
	addu t0, s4, s5		# t0 = buffer pointer + file length
	subu t0, t0, 1
	
	lb t1, 0(s6)		# Load character value
	sb t1, 0(t0)		# save character
	
	li t0, 10			# \n ascii value
	lb t1, 0(s6)		# Load character value
	beq t1, t0, endFile	# if character == '\n' break
	
	li v0, SYS_read		# system call for write to read
	move a0, s0			# file descriptor
	move a1, s6			# s6 <- character
	li a2, 1			# read 1 byte
	syscall				# read file
	bltz v0, read_error
	
	b fileLoop
	
increaseMalloc:
	addu s3, s3, s3	# InitialBuffer = InitialBuffer * 2
	addiu t0, s3, 2	# InitialBuffer = InitialBuffer + 2
	move a0, t0
	jal mymalloc	# v0 <- new buffer
	
	move t1, s3		# Original length
	move t2, zero	# currentPosition = 0

increaseMallocLoop:
	beq t2, t1, endIncrease	# if currentPosition == originalLength
	
	addu t3, s4, t2
	lb t4, 0(t3)		# load character at old buffer
	
	addu t3, v0, t2
	sb t4, 0(t3)		# Save character at new buffer
	
	addiu t2, t2, 1
	
	b increaseMallocLoop
	
	
endIncrease:
	move s4, v0		# old buffer = new buffer
	b continueLoop
	
	
endFile:
	move	s7, s5		# s7 <- fileLength
	subu	s7, s7, 2	# fileLength = fileLength - 2
	
reverseLoop:
	addu	t0, s7, s4	# t2 <- buffer element index

	li		v0, SYS_write	# system call for write to file
	move	a0, s1			# file descriptor
	move	a1, t0			# address of buffer from which to write
	li		a2, 1			# write length
	syscall					# write to file
	bltz v0, write_error
	
	beqz	s7, end		# end reverting string

	subu	s7, s7, 1	# buffer index - 1
	
	b reverseLoop

read_error:
	li v0, 1	# error code 1
	b end

write_error:
	li v0, 2	# error code 2
	b end
	
end:
	lw	ra, 24(sp)
	lw	$fp, 20(sp)
	lw	gp, 16(sp)
	addiu	sp, sp, 32
	jr ra
.end reverse

