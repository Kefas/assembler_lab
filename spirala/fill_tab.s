	.code32
	.type fill_tab, @function
	.global fill_tab
	.data
rozmiar:
	.long 0

wiersz:
	.long 0

kolumna:
	.long 0

	.text
	
	

	# 8(%ebp) adres tablicy
	# 12(%ebp) rozmiar cols
	# 16(%ebp) rozmiar rows

fill_tab:
	pushl %ebp
	movl %esp, %ebp

	movl 12(%ebp), %eax
	movl 16(%ebp), %ebx

	mul %ebx
	movl %eax, %ecx # ecx = rows*cols
	movl %ecx, rozmiar
	decl rozmiar

	movl 12(%ebp), %eax
	movl %eax, kolumna
	movl 16(%ebp), %eax
	movl %eax, wiersz
	
	movl $1, %edx #przesuniecie - najpierw idziemy w prawo
	movl $0, %edi
	movl $1, %esi

	movl 8(%ebp), %eax

w_prawo:
	movl $1, %edx
	#sprawdzenie czy esi == rows*cols
	pushl %eax
	
	movl rozmiar, %eax
	incl %eax
	incl %eax
	cmpl %eax, %esi
	
	popl %eax	
	JE koniec

	#sprawdzenie czy nie nadpisuje jakiejs liczby

	cmpl $0, (%eax, %edi, 4)
	JNE wroc_w_dol
	

	
	movl %esi, (%eax,%edi,4)
	incl %esi

	#sprawdzenie czy edi == cols - 1

	pushl %eax
	movl 12(%ebp), %eax
	decl %eax
	cmpl %edi, %eax
	popl %eax
	
	JE w_dol

	#dodanie edx do edi

	pushl %eax
	movl %edi, %eax
	addl %edx, %eax
	movl %eax, %edi
	popl %eax

	jmp w_prawo

w_dol:


	#sprawdzenie czy esi == rows*cols
	pushl %eax
	
	movl rozmiar, %eax
	incl %eax
	incl %eax
	cmpl %eax, %esi
	
	popl %eax	
	JE koniec

	NOP
	
	movl wiersz, %edx
	
	#dodanie edx do edi

	pushl %eax
	movl %edi, %eax
	addl %edx, %eax
	movl %eax, %edi
	popl %eax

	#sprawdzenie czy nie nadpisuje jakiejs liczby

	cmpl $0, (%eax, %edi, 4)
	JNE wroc_w_lewo

	movl %esi, (%eax,%edi,4)
	incl %esi

	

	# %edi == rozmiar -1

	cmpl %edi, rozmiar
	JE w_lewo

	jmp w_dol

w_lewo:

	#sprawdzenie czy esi == rows*cols
	pushl %eax
	
	movl rozmiar, %eax
	incl %eax
	incl %eax
	cmpl %eax, %esi
	
	popl %eax	
	JE koniec

	NOP

	
	movl $-1, %edx

	pushl %eax
	movl %edi, %eax
	addl %edx, %eax
	movl %eax, %edi
	popl %eax

	#sprawdzam czy nie nadpisuje liczby

	cmpl $0, (%eax, %edi, 4)
	JNE wroc_w_gore

	movl %esi, (%eax,%edi,4)
	incl %esi

	# czy edi == rows *cols - cols -1

	pushl %eax
	movl rozmiar, %eax
	movl 12(%ebp), %ebx
	subl %ebx, %eax
	incl %eax

	cmpl %edi, %eax

	popl %eax

	JE w_gore

	jmp w_lewo
w_gore:
	#sprawdzenie czy esi == rows*cols
	pushl %eax
	
	movl rozmiar, %eax
	incl %eax
	incl %eax
	cmpl %eax, %esi
	
	popl %eax	
	JE koniec

	NOP
	
	movl wiersz, %edx
	neg %edx


	#dodawanie edx do edi
	pushl %eax
	movl %edi, %eax
	addl %edx, %eax
	movl %eax, %edi
	popl %eax

	

	cmpl $0, (%eax, %edi, 4)
	JNE wroc_w_prawo

	movl %esi, (%eax,%edi,4)
	incl %esi

	jmp w_gore
koniec:	
	

	popl %ebp
	ret

wroc_w_prawo:
	pushl %eax
	movl %edi, %eax
	subl %edx, %eax
	movl %eax, %edi
	incl %edi
	popl %eax
	

	jmp w_prawo
wroc_w_dol:

	decl %edi
	jmp w_dol

wroc_w_lewo:	
	pushl %eax
	movl %edi, %eax
	subl %edx, %eax
	movl %eax, %edi
	popl %eax

	jmp w_lewo

wroc_w_gore:
	incl %edi
	jmp w_gore
	
	