	.code32
	.type digits_count, @function
	.global digits_count
	.data
do_printf:
	.ascii "wyswietlam %c\n"

count:
	.long 0
	
	.text

# long digits_count(char* buf, long* digits, long* max_digits) 
	
digits_count:
	pushl %ebp
	movl %esp, %ebp
	
	#sciagam ze stosu argumenty
	movl 8(%esp), %eax
	movl 12(%esp), %ebx
	movl 16(%esp), %edx

	NOP

	pushl %edx
	# 0 do indeksu
	movl $0, %edi

dupa:
	#zabezpieczenie rejestrow bo printf wykorzystuje te rejestry
	pushl %eax
	pushl %ebx
	
	# eax + edi * 1
	# przegladanie tablicy charow
#	push (%eax,%edi,1)
#	pushl $do_printf
#	call printf
#	addl $8, %esp # usuniecie ze stosu tych dwoch argumentow
	
	popl %ebx
	popl %eax

	#wrzucamy chara do dl zeby moc go porownac z 9 i byc niezaleznym od eax
	XOR %edx, %edx
	movb (%eax, %edi, 1), %dl
	incl %edi
	
	CMPB $'9', %dl 
	JBE is_number
	
next:	
	CMPB $0, (%eax, %edi, 1)
	JNZ dupa

	NOP

	popl %edx
	movl $0, %edi
	movl $9, %ecx
	movl $0, (%edx)
	
petla:
	pushl %ecx
	movl (%edx), %ecx # nie moge uzyc (%edx) przy offsecie wiec uzywam ecx
	movl (%ebx, %edi, 4), %eax #(pobranie nastepnej)
	cmpl (%ebx,%ecx,4), %eax
	JG max_num
	
next2:
	incl %edi
	popl %ecx
	LOOP petla

	movl count, %eax
	popl %ebp
	ret
	
is_number:
	incl count

	NOP
	
	subl $48, %edx	
	incl (%ebx, %edx, 4)		
	JMP next

max_num:
	MOVL %edi, (%edx)
	JMP next2


	