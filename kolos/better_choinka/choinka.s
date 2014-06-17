	.code32
	.type choinka, @function
	.global choinka
	.data
znak:
	.ascii " "
enter:
	.ascii "\n"
	
	.text
choinka:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %eax
	movl 12(%esp), %ebx

	movl (%eax), %ecx

loopik:
	pushl %ecx
	movl (%eax), %ecx
loopik_wew:
	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx

	movl $0x04, %eax
	movl $0x01, %ebx
	movl $znak, %ecx
	movl $0x01, %edx

	int $0x80

	popl %edx
	popl %ecx
	popl %ebxx
	popl %eax
	loop loopik_wew
	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	

	movl $0x04, %eax
	movl $0x01, %ebx
	movl $enter, %ecx
	movl $0x01, %edx

	int $0x80

	popl %edx
	popl %ecx
	popl %ebx
	popl %eax

	
	popl %ecx
	loop loopik
	

	popl %ebp
	ret
	