	.file	1 "ownRev.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"-v\000"
	.align	2
$LC1:
	.ascii	"--version\000"
	.align	2
$LC2:
	.ascii	"Version 1.0.0\n\000"
	.align	2
$LC3:
	.ascii	"-h\000"
	.align	2
$LC4:
	.ascii	"--help\000"
	.align	2
$LC5:
	.ascii	"Usage\n\000"
	.text
	.align	2
	.globl	checkOption
	.ent	checkOption
checkOption:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$a0,48($fp)
	la	$a1,$LC0
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L19
	lw	$a0,48($fp)
	la	$a1,$LC1
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L18
$L19:
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L17
$L18:
	lw	$a0,48($fp)
	la	$a1,$LC3
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L22
	lw	$a0,48($fp)
	la	$a1,$LC4
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L20
$L22:
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L17
$L20:
	sw	$zero,24($fp)
$L17:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	checkOption
	.size	checkOption, .-checkOption
	.align	2
	.globl	swapChars
	.ent	swapChars
swapChars:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	sw	$a2,32($fp)
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	bne	$v1,$v0,$L24
	b	$L23
$L24:
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,8($fp)
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	addu	$a0,$v1,$v0
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
$L23:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	swapChars
	.size	swapChars, .-swapChars
	.align	2
	.globl	reverseString
	.ent	reverseString
reverseString:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	lw	$v0,56($fp)
	lw	$v0,4($v0)
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,56($fp)
	lw	$a0,28($fp)
	lw	$a1,0($v0)
	lw	$a2,24($fp)
	la	$t9,strncpy
	jal	$ra,$t9
	sw	$zero,32($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,-2
	sw	$v0,36($fp)
$L26:
	lw	$v0,32($fp)
	lw	$v1,36($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L28
	b	$L27
$L28:
	addu	$v1,$fp,32
	lw	$v0,0($v1)
	move	$a1,$v0
	addu	$v0,$v0,1
	sw	$v0,0($v1)
	addu	$v1,$fp,36
	lw	$v0,0($v1)
	move	$a2,$v0
	addu	$v0,$v0,-1
	sw	$v0,0($v1)
	lw	$a0,28($fp)
	la	$t9,swapChars
	jal	$ra,$t9
	b	$L26
$L27:
	lw	$v1,28($fp)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	reverseString
	.size	reverseString, .-reverseString
	.rdata
	.align	2
$LC6:
	.ascii	"Error: unable to allocate %d bytes on line 88\n\000"
	.align	2
$LC7:
	.ascii	"Error: unable to allocate %d bytes on line 107\n\000"
	.align	2
$LC8:
	.ascii	"Error: unable to allocate %d bytes on line 126\000"
	.align	2
$LC9:
	.ascii	"Error: unable to allocate %d bytes on line 132\000"
	.text
	.align	2
	.globl	readFromFile
	.ent	readFromFile
readFromFile:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	li	$v0,30			# 0x1e
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,2
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L30
	lw	$v0,24($fp)
	addu	$v0,$v0,2
	la	$a0,__sF+176
	la	$a1,$LC6
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L29
$L30:
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	lw	$a0,72($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,36($fp)
$L31:
	lw	$v0,72($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L33
	b	$L32
$L33:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	addu	$v1,$v0,1
	lw	$v0,24($fp)
	bne	$v1,$v0,$L34
	lw	$v0,24($fp)
	sll	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L35
	la	$a0,__sF+176
	la	$a1,$LC7
	lw	$a2,24($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L29
$L35:
	lw	$v0,32($fp)
	sw	$v0,28($fp)
$L34:
	lw	$v1,28($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	addu	$v1,$v0,-1
	lbu	$v0,36($fp)
	sb	$v0,0($v1)
	lw	$v1,36($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L36
	b	$L32
$L36:
	lw	$a0,72($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,36($fp)
	b	$L31
$L32:
	lw	$v0,40($fp)
	bne	$v0,$zero,$L37
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L29
$L37:
	lw	$a0,28($fp)
	lw	$a1,40($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L38
	la	$a0,__sF+176
	la	$a1,$LC8
	lw	$a2,24($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L29
$L38:
	li	$a0,8			# 0x8
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bne	$v0,$zero,$L39
	la	$a0,__sF+176
	la	$a1,$LC9
	li	$a2,8			# 0x8
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,48($fp)
	b	$L29
$L39:
	lw	$v1,44($fp)
	lw	$v0,32($fp)
	sw	$v0,0($v1)
	lw	$v1,44($fp)
	lw	$v0,40($fp)
	sw	$v0,4($v1)
	lw	$v0,44($fp)
	sw	$v0,48($fp)
$L29:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	readFromFile
	.size	readFromFile, .-readFromFile
	.rdata
	.align	2
$LC10:
	.ascii	"%s\000"
	.text
	.align	2
	.globl	reverseFile
	.ent	reverseFile
reverseFile:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$zero,24($fp)
	lw	$a0,48($fp)
	la	$t9,readFromFile
	jal	$ra,$t9
	sw	$v0,28($fp)
$L41:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L43
	b	$L40
$L43:
	lw	$a0,28($fp)
	la	$t9,reverseString
	jal	$ra,$t9
	sw	$v0,24($fp)
	la	$a0,$LC10
	lw	$a1,24($fp)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,28($fp)
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,48($fp)
	la	$t9,readFromFile
	jal	$ra,$t9
	sw	$v0,28($fp)
	b	$L41
$L40:
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	reverseFile
	.size	reverseFile, .-reverseFile
	.rdata
	.align	2
$LC11:
	.ascii	"r\000"
	.align	2
$LC12:
	.ascii	"Error: unable to open file %s\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$zero,24($fp)
	lw	$v1,56($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L45
	la	$a0,__sF
	la	$t9,reverseFile
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L44
$L45:
	lw	$v1,56($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L46
	lw	$v0,60($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$t9,checkOption
	jal	$ra,$t9
	beq	$v0,$zero,$L46
	sw	$zero,32($fp)
	b	$L44
$L46:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
$L48:
	lw	$v0,28($fp)
	lw	$v1,56($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L51
	b	$L49
$L51:
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,60($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC11
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L52
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,60($fp)
	addu	$v0,$v1,$v0
	la	$a0,__sF+176
	la	$a1,$LC12
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L50
$L52:
	lw	$a0,24($fp)
	la	$t9,reverseFile
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L50:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L48
$L49:
	sw	$zero,32($fp)
$L44:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
