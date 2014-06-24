	.code32
	.type find_character, @function
	.global find_character

	.data


	.text

find_character:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %eax
	movl $0, %esi
	movl $0, %edi

bubuj:
	movb (%eax, %edi, 1), %bl
	incl %edi
	pushl %edx
	movl 12(%esp), %edx
	cmpb %bl, (%edx)
	JE znaleziono
	
next:	
	popl %edx
	cmpb $0, %bl
	JNE bubuj

	
	movl %esi, %eax


	popl %ebp
	ret

znaleziono:
	cmpl $0, %esi
	JE pierwszy
	
next2:
	pushl %edx
	movl 28(%esp), %edx
	movl %edi, (%edx)
	popl %edx
	
	incl %esi
	jmp next


pierwszy:
	pushl %edx
	movl 24(%esp), %edx
	movl %edi, (%edx)
	popl %edx
	jmp next2
