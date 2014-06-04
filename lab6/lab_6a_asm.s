#----------------------------------------------------------------
# Funkcja do programu lab_6a - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
	.code32
	.text
	.type facta, @function
	.globl facta	

facta:	pushl %ebp
	movl %esp, %ebp 	#wskaznik stosu esp sie moze zmienic wiez uzywamy ebp

	subl $4, %esp		#przesuniecie indeksu esp o 4b w strone mniejszych adresow

	movl 8(%ebp), %eax	#zawartosc rejestru ebp przesunieta o 8 do eax
	cmpl $1, %eax		# jezeli == 1 to skaczemy do f_1 zwracamy 1 w eax
	jbe f_1

	movl %eax, -4(%ebp)	# zapamietujemy w zmienna lokalna ( 4 b od ebp)
	dec %eax		#dekrementacja

	pushl %eax		#kladziemy argument na stos
	call facta		#rekurencja
	addl $4, %esp		#usuwanie ze stosu, nie zdejmujemy ze stosu tylko przesuwamy sobie wskaznik stosu

	mull -4(%ebp)		# eax = eax * -4(ebp)
	jmp f_e

f_1:	movl $1, %eax

f_e:	movl %ebp, %esp
	popl %ebp
	ret
