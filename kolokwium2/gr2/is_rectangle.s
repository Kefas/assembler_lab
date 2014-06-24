	.code32
	.type is_rectangle, @function
	.global is_rectangle
	.data

	.text


is_rectangle:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl 16(%esp), %edx

	pushl %edx
	movl %ebx, %eax
	mul %ebx
	popl %edx
	pushl %eax
	pushl %edx
	movl %ecx, %eax
	mul %ecx
	popl %edx
	pushl %eax
	movl %edx, %eax
	mul %edx
	pushl %eax

	movl 4(%esp), %eax
	addl 8(%esp), %eax
	cmpl %eax, (%esp)
	JE kwadratowy

	movl $0, %eax
next:	
	
	addl $12, %esp
	
	popl %ebp
	ret

kwadratowy:
	movl $1, %eax
	jmp next
	