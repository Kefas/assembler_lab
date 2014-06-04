	.data32
	.type choinka, @function
	.globl choinka

	.data

bufor:
	.ascii "     \n"
label:
	.equ len, label-bufor


choinka:
	pushl %ebp
	movl %esp, %ebp
	