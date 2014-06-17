	.code32
	.type reverse_tab_arg, @function
	.global reverse_tab_arg

	.data


	.text

reverse_tab_arg:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %ebx
	movl 12(%esp), %ecx

		
	movl $0, %edi

	decl %ecx

	#odwracanie
petla:
	
	movl %edi, %eax
	subl %ecx,%eax	
	cmpl $1, %eax
	JBE next

	pushl (%ebx, %edi, 4)
	pushl (%ebx, %ecx, 4)

	popl (%ebx, %edi, 4)
	popl (%ebx, %ecx, 4)


	incl %edi		
	loop petla
next:


	#srednia arytmetyczna
	movl 12(%esp), %ecx
	movl $0, %eax
	movl $0, %edi
	#decl %ecx
petla2:
	addl (%ebx, %edi, 4), %eax
	incl %edi

	loop petla2

	XOR %edx, %edx   # czysci edx, bez tego to nie zadziala
	
	movl 12(%esp), %ebx
	div %ebx
	
	popl %ebp
	

	ret
	