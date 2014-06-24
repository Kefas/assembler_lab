	.code32
	.type replace, @function
	.global replace
	.data

	.text

	# 8(%ebp) adres tablicy
	# 12(%ebp) pierwszy char
	# 16(%ebp) drugi char
	# 20(%ebp) adres licznika zamian

replace:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%ebp), %eax
	movl 20(%ebp), %edx
	movl $0, %edi
	movl $0, %esi

bubuj:
	movb (%eax, %edi,1), %bl
	cmpb %bl, 12(%ebp)
	JE zamien21

	cmpb %bl, 16(%ebp)
	JE zamien12

next:

	incl %edi
	cmpb $0, %bl
	JNE bubuj

	popl %ebp
	ret

zamien12:
	movb 12(%ebp), %cl
	movb %cl, (%eax, %edi, 1)
	incl (%edx)

	jmp next

zamien21:
	movb 16(%ebp), %cl
	movb %cl, (%eax, %edi, 1)
	incl (%edx)

	jmp next
	