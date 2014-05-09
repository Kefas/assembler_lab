#----------------------------------------------------------------
# Program lab_6c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile&link: gcc -o lab_6c lab_6c.s
#  To run: 	    ./lab_6c
#
#----------------------------------------------------------------

	.data
fmt:
	.asciz	 "Value = %d\n" #lancuch znakow musi sie konczyc \0 dlatego asci(zero) to samo mozna uzyskac za pomoca string
value:
	.long	15
	
	.text
	.global main #dzieki temu ze jest main to mozemy uzywac funkcji z c
	
main:
	movl value, %eax
	pushl %eax
	movl $fmt, %ebx	#przekazujemy w postaci adresu
	pushl %ebx
	call printf
	addl $8, %esp	#usuwanie ze stosu - przesuniecie wskaznika stosu(dodawanie a nie odejmowanie)
	nop
	pushl $0 
	call exit
