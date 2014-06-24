	.code32
	.type fill_tab, @function
	.global fill_tab
	.data

	.text


	# 8(%ebp) tablica address
	# 12(%ebp) rows
	# 16(%ebp) cols
	# 20(%ebp) switch
	
fill_tab:
	pushl %ebp
	movl %esp, %ebp
	
	movl 12(%ebp), %eax
	movl 16(%ebp), %ebx
	
	mul %ebx
	movl %eax, %ecx
	movl $1, %edi

petelka:

	xor %edx, %edx
	movl %edi, %eax
	movl $5, %ebx
	div %ebx



	cmpl $1, 20(%ebp)
	JB mnozenie
	JE modulo
	JG dzielenie

next:	

	incl %edi
	loop petelka

	popl %ebp
	ret

mnozenie:
	
	mul %edx
	pushl %ebx
	movl 8(%ebp), %ebx
	movl %eax, (%ebx, %edi,4)	
	popl %ebx

	jmp next

modulo:
	pushl %ebx
	movl %edx, %ebx
	xor %edx, %edx
	incl %ebx
	div %ebx

	movl 8(%ebp), %ebx
	movl %edx, (%ebx, %edi,4)


	popl %ebx
	jmp next

dzielenie:
		pushl %ebx
	movl %edx, %ebx
	xor %edx, %edx
	incl %ebx
	div %ebx

	movl 8(%ebp), %ebx
	movl %eax, (%ebx, %edi,4)


	popl %ebx

	jmp next

