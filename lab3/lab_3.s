#----------------------------------------------------------------
# Program LAB_3.S - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_3.o lab_3.s
#  To link:    ld -o lab_3 lab_3.o
#  To run:     ./lab_3
#
#---------------------------------------------------------------- 

	.equ	kernel,	0x80
	.equ	exit,	0x01
	.equ	stdout,	0x01
	.equ	write,	0x04
	.equ	dig0,	'0'

#----------------------------------------------------------------

.data

table:					# table of items
	.long	10,70,50,90,60,80,40,20,0,30, 12
count:					# count of items
	.long	( . - table ) >> 2	#. to biezacy adres w procesie komp.					    # >> operator przesunieca bitowego
events:	
	.long	0
item:	
	.string	"Item "
line_no:	
	.string	"   "
itemval:	
	.string	" = "
number:	
	.string	"     \n"
before:	
	.string	"\nBefore:\n"
after:	
	.string	"\nAfter:\n"
dataend:

	.equ	item_len, before - item
	.equ	bef_len, after - before
	.equ	aft_len, dataend - after

#----------------------------------------------------------------

	.text
	.global _start

_start:
	NOP
	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$before,%ecx
	MOVL	$bef_len,%edx
	INT	$kernel

	CALL	disp_table

	CALL	do_something

	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$after,%ecx
	MOVL	$aft_len,%edx
	INT	$kernel

	CALL	disp_table

	MOVL	events,%ebx
	MOVL	$exit,%eax
	INT	$kernel

#----------------------------------------------------------------
#
#	Function:	do_something
#	Parameters:	none
#

	.type do_something,@function

do_something:
	MOVL	count,%edx
	MOVL	$0,events
outer:		
	DEC	%edx			#decrement
	XOR	%esi,%esi		#zerowanie 
	MOV	%edx,%ecx	
inner:		
	MOVL	table(,%esi,4),%eax
	CMPL	table+4(,%esi,4),%eax	# compare long
	JAE	noswap			# sortowanie
	XCHGL	table+4(,%esi,4),%eax
	MOVL	%eax,table(,%esi,4)
	INCL	events
noswap:		
	INC	%esi			# increment
	LOOP	inner
	CMPL	$1,%edx			#compare long
	JNZ	outer			#jump if not zero

	RET

#----------------------------------------------------------------
#
#	Function:	disp_table
#	Parameters:	none
#

	.type disp_table,@function

disp_table:
	XOR	%esi,%esi
	MOVL	count,%ecx	#ustawienie licznika petli
	

disp_item:		
	MOVL	table(,%esi,4),%ebx
	CALL	make_string
	
	PUSH 	%ecx		#musi byc w petli!

	MOVL	$write,%eax
	MOVL	$stdout,%ebx
	MOVL	$item,%ecx
	MOVL	$item_len,%edx
	INT	$kernel

	INC	%esi
	POP 	%ecx
	LOOP	disp_item

	RET	

#----------------------------------------------------------------
#
#	Function:	make_string
#	Parameters:	%esi - index of element
#			%ebx - value of element
#

	.type make_string,@function

make_string:
	MOVL 	$0x20202020, number # 0x20 = 32 spacja (ASCII)
	MOVW	$0x2020, line_no
	MOV	%esi,%eax  # indeks tablicy do eax
	MOVL	$line_no + 2,%edi # ?? druga cyfra do edi?
	CALL	n2str

	MOV	%ebx,%eax
	MOVL	$number + 4,%edi
	CALL	n2str

	RET	

#----------------------------------------------------------------
#
#	Function:	n2str
#	Parameters:	%eax - value
#			%edi - address of last character
#

	.type n2str,@function
n2str:
	#dzielna jest para rejstrow bardziej znaczacqa czesc w edx, mniej znaczaca ebx

	#uzywamy stosu zeby argumentow nie stracic
	PUSH	%ebx		
	PUSH	%edx
	MOVL	$10,%ebx	# divisor in EBX, dividend in EAX
nextdig:		
	XOR	%edx,%edx	#iloraz do EAX, reszta do EDX
	DIV	%ebx		# EDX:EAX div EBX
	ADDB	$dig0,%dl	# remainder in EDX
	MOVB	%dl,(%edi)	# *(EDI) = character
	CMPL	$0,%eax		# quotient in EAX 
	JZ	empty
	DEC	%edi		# EDI--   EDI robia za wskaznik
	JMP	nextdig
empty:		
	POP	%edx
	POP	%ebx		#wazne zeby kolejnosc push byla odwrotna do pop

	RET	

#----------------------------------------------------------------
