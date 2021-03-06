#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#
#----------------------------------------------------------------

	.equ	kernel,0x80	#Linux system functions entry
	.equ	write,0x04	#write data to file function
	.equ	exit,0x01	#exit program function
	.equ	stdout,0x01	#handle to stdout

	.data
	
starttxt:			#first message
	.ascii	"Start\n"
endtxt:				#second message
	.ascii	"Finish\n"
arg1:				#first argument
	.byte		1
arg2:				#second argument
	.word		2
arg3:				#third argument
	.long		3
result:				#result
	.long		0	

.equ	startlen, endtxt - starttxt
.equ	endlen, arg1 - endtxt
#moze byc pusta etykieta
	
	.text
	.global _start
	
_start:
	#komentarz
	NOP
	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$starttxt,%ecx
	MOVL	$startlen,%edx
	INT	$kernel
	NOP
	#MOVL $0  eax lub SUB eax,eax lub XOR eax,eax - zerowanie
	XOR	%eax,%eax
	XOR	%ebx,%ebx	
	MOVL	arg1,%eax	
	MOVL	arg2,%ebx
	MOVL	arg3,%ecx
	ADD	%ebx,%eax
	SUB	%ecx,%eax
	MOVL	%eax,result
	nop
	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$endtxt,%ecx
	MOVL	$endlen,%edx
	INT	$kernel
	NOP
theend:
	MOVL 	$5,%ebx
	MOVL	$exit,%eax
	INT	$kernel
	