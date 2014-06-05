	.code32
	.type n2str, @function
	.global n2str

	.data

bufor:
	.ascii "    \n"

print:
	.ascii "%d\n\0"



	.text

n2str:
	pushl %ebp
	movl %esp,%ebp

	movl 8(%ebp), %eax
	movl 12(%ebp), %ecx
	xor %edx, %edx

petla:
	pushl %ecx
	pushl %eax

	addl (%eax), %edx
	movl (%eax), %eax
	
	
	call make_string
	
	#pushl (%eax)
	#pushl $print
	#call printf
	#addl $8, %esp

	popl %eax
	addl $4, %eax
	
	popl %ecx
	loop petla
	


	movl %edx, %eax
	popl %ebp
	ret


make_string:
	movl $0x20202020, bufor
	pushl %eax
	pushl %edx
	movl $2, %edi
dig:	
	movl $10, %ebx
	xor %edx, %edx
	div %ebx
	
	addb $48, %dl
	movb %dl, bufor(,%edi, 1)
	cmpl $0, %eax
	jz empty
	dec %edi
	jmp dig
	


empty:
	movl $4, %eax
	movl $1, %ebx
	movl $bufor, %ecx
	movl $5, %edx

	int $0x80
	popl %edx
	popl %eax
	ret
	