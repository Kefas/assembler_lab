	.code32
	.type myprintf, @function
	.globl myprintf

	.data
tekst:
	.ascii "tekst\n"

rest:
	.ascii "0000"


	.text
	
myprintf:
	pushl %ebp
	movl %esp, %ebp


	movl 8(%ebp), %ecx
	movl $0, %edi
	SHL $8, %ecx
	movb %ch,  rest(,%edi,1)	
	movl $0x04, %eax
	movl $0x01, %ebx

	#----
	#movl $2, %edi
	#movb $49, rest(,%edi,1) 
	movl $rest, %ecx
	#movb $'1', %cl
	#---
	
	movl $4, %edx
	
	int  $0x80

	popl %ebp
	
	ret
	