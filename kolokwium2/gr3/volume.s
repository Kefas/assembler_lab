	.code32
	.type volume, @function
	.global volume
	.data
PI:
	.double 3.14
	.text

# r 8(%esp)
# h 16(%esp
	
volume:
	pushl %ebp
	movl %esp, %ebp
	FINIT
	FLDL PI
	FLDL 8(%ebp)
	FLDL 8(%ebp)
	FLDL 16(%ebp)

	FMULP
	FMULP
	FMULP #wynik zostaje na stosie i dobrze, bo funkcja zwraca chyba to
	
	popl %ebp
	ret
	