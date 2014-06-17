	.code32
	.type digit_count, @function
	.global digit_count
	.data


	.text

	#long digit_count(char * buf, long * digits, long * max_digit)

digit_count:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %eax
	movl 12(%esp), %edx
	movl $0, %edi
	movl $0, %ecx
	

petelka:
	xor %ebx, %ebx
	movb (%eax,%edi,1), %bl
	cmpb $'9', %bl
	JBE cyfra
next:	

	incl %edi
	
	cmpb $0, %bl
	JNE petelka

	movl %ecx, %eax
	movl $10, %ecx
	movl 16(%esp), %ebx
	movl $0, %edi
	
loopik:

	pushl %eax
	pushl %ecx
	movl (%edx,%edi,4), %eax
	movl (%ebx), %ecx
	
	cmpl %eax, (%edx, %ecx, 4)
	JB zamiana
	
next2:
	incl %edi
	
	popl %ecx
	popl %eax
	LOOP loopik

	popl %ebp
	ret

cyfra:
	cmpb $'0', %bl
	JGE na_pewno_cyfra
	jmp next

na_pewno_cyfra:
	pushl %ebx
	subl $48, %ebx
	incl (%edx, %ebx,4)
	incl %ecx
	popl %ebx
	jmp next

zamiana:
	movl %edi, (%ebx)
	jmp next2
	