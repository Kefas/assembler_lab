#----------------------------------------------------------------
# Program lab_2.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_2.o lab_2.s
#  To link:    ld -o lab_2 lab_2.o
#  To run:     ./lab_2
#
#----------------------------------------------------------------
	.code32
	.equ	kernel,0x80	#Linux system functions entry
	.equ	write,0x04	#write data to file function
	.equ	exit,0x01	#exit program function
	.equ	stdout,0x01 	#handle to stdout

	.data
	
arg1txt:
	.ascii	"Arg1 = "
arg2txt:
	.ascii	"Arg2 = "
sumtxt:
	.ascii	"Sum  = "
difftxt:
	.ascii	"Diff = "
ortxt:
	.ascii	"OR   = "
andtxt:
	.ascii	"AND  = "
xortxt:
	.ascii	"XOR  = "
arg1:				#first argument
	.byte	0xA0
arg2:				#second argument
	.byte	0x05
result:				#result
	.byte	0
tmp:
	.byte	0
restxt:
	.ascii	"  \n"
txtlen:
	.long	7
reslen:
	.long	3
 
	.text
	.type lab2, @function
	.global lab2
	
lab2:
	NOP

	MOVB	arg1,%al
	MOVL	$arg1txt,%ecx
	CALL	disp_line

	MOVB	arg2,%al
	MOVL	$arg2txt,%ecx
	CALL	disp_line

 	MOVB	arg1,%al
	ADDB	arg2,%al
	MOVB	%al,result

	MOVL	$sumtxt,%ecx
	CALL	disp_line

	MOVB	arg1,%al
	SUBB	arg2,%al
	MOVB	%al,result

	MOVL	$difftxt,%ecx
	CALL	disp_line

	MOVB	arg1,%al
	ORB	arg2,%al
	MOVB	%al,result

	MOVL	$ortxt,%ecx
	CALL	disp_line

	MOVB	arg1,%al
	ANDB	arg2,%al
	MOVB	%al,result

	MOVL	$andtxt,%ecx
	CALL	disp_line

	MOVB	arg1,%al
	XORB	arg2,%al
	MOVB	%al,result

	MOVL	$xortxt,%ecx
	CALL	disp_line

	MOVL	$exit,%eax
	XORL	%ebx,%ebx 
	INT	$kernel

#----------------------------------------------------------------
# disp_line - displays line of text (prompt + hexadecimal number)
#----------------------------------------------------------------

	.type disp_line,@function

disp_line:
	MOVB	%al,tmp

	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	txtlen,%edx
	INT	$kernel

	MOVB	tmp, %al
	AND	$0x0F,%al #licza sie tylko mlodsze bity
	CMPB	$10,%al
	JB	digit1 # Jump if Below - jezeli w al jest liczba mniejsza od 10 to nie trzeba jej modyfikowac
	ADDB	$('A'-0x0A),%al #jezeli liczba wieksza lub rowna 10 to ...
	JMP	insert1
digit1:
	ADDB	$'0',%al
insert1:
	MOV	%al,%ah # po co to?

	MOVB	%al,tmp
	SHR	$4,%al #przesuwa bity w rejestrze al o 4 bity w prawo
	CMPB	$10,%al #compare byte
	JB	digit2
	ADDB	$('A'-0x0A),%al
	JMP	insert2
digit2:
	ADDB	$'0',%al
insert2:
	MOVW	%ax,restxt

	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$restxt,%ecx
	MOVL	reslen,%edx
	INT	$kernel

	RET
	