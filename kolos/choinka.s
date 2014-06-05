	.code32
	.type choinka, @function
	.globl choinka

	.data

bufor:
	.ascii "        "
bufor2:
	.ascii "       \n"
label:
	.equ len, label-bufor
doPrintf:
	.ascii "%d\n\0"

	.text

choinka:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%ebp), %ecx 	#wrzucam argument do rejestru ecx ktory jest licznikiem petli
	movl %ecx, %eax 	#do eax zapisujemy argument zdjety ze stosu( rozmiar choinki)


#petla:
#	pushl %ecx


petla2:
	pushl %ecx
	pushl %eax
	

	movl %ecx, %edi
	movb $'*', bufor(,%edi,1)


	movl $4, %eax
	movl $1, %ebx
	movl $bufor, %ecx
	movl $len, %edx

	int $0x80
	

	
	#pushl %ecx
	#pushl $doPrintf
	#call printf
	#addl $8, %esp

	popl %eax
	popl %ecx
	loop petla2

	
#	popl %ecx
	
#	loop petla


	pop %ebp

	ret
	