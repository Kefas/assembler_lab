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


	movl 8(%ebp), %ecx	#kopiujemy 4bajty (bo movL) z adresu ebp + 8 do ecx
	movl $0, %edi		#ustawiamy nasz 'indeks' na 0
	SHL $8, %ecx		#przesuwamy w lewo nasz rejestr ecx
	movb %ch,  rest(,%edi,1)#dzieki czemu z rejestru cl wszystko przeszlo do ch
				#nie jest to konieczne
				# tylko pokazuj ze sie da ;)
	movl $0x04, %eax
	movl $0x01, %ebx
	movl $rest, %ecx	
	movl $4, %edx
	
	int  $0x80

	popl %ebp
	
	ret
	