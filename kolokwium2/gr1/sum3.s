	.code32
	.type sum3, @function
	.global sum3
	.data

	.text
# 8(%esp) double a
# 16(%esp) double b
# 24(%esp) double c

sum3:
	pushl %ebp
	movl %esp, %ebp
	FINIT
	FLDZ

	FADDL 8(%ebp)
	FADDL 16(%ebp)
	FADDL 24(%ebp)


	popl %ebp
	ret