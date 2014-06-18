	.type deriv, @function
	.global deriv

	.data

	.text

deriv:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl 16(%esp), %edx

	movl $0, (%edx)
	movl $1, %edi

loopik:
	pushl %eax
	pushl %ecx

	decl %edi
	movl (%ebx, %edi, 4), %ecx

	incl %edi
	movl (%ebx, %edi, 4), %eax

	subl %ecx, %eax

	movl %eax, (%edx, %edi,4) 

	incl %edi
	popl %ecx
	popl %eax
	loop loopik

	

	
	popl %ebp
	ret
	