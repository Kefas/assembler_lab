	.code32
	.type order_of, @function
	.global order_of

	.data
bufor:
	.ascii "    \0"
	
	.text
order_of:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %eax
	movl 12(%esp), %ebx
	movl 16(%esp), %ecx
	movl 20(%esp), %edx

	movl $0, %edi

	
	
	

	movl $bufor, %eax
	
	popl %ebp
	ret

