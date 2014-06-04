	.code32
	.type dodaj, @function
	.globl dodaj

	.data
	.equ kernel, 0x80


wypisz:
	.ascii "----\n"
len:
	.equ item, len - wypisz


dodaj:
	pushl %ebp
	movl %esp, %ebp
	# - to po to zeby ebp sie nie stracilo - wazne zeby na koncu funkcji byl pop ebp

		
	movl 8(%ebp), %eax    # wziecie ze stosu pierwszego argumentu
	movl 12(%ebp), %ebx   # wziecie ze stosu drugiego argumentu
	addl %ebx, %eax	      # dodanie argumentow do siebie - wynik w eax
	
# jezeli chce sie zwrocic wynik dodawania do funkcji to wystarczy ze wynik bedzie w rejestrze eax

# jezeli chce sie wypisac wynik to mozna odkomentowac ponizsze
# nalezy pamietac,ze wyswietli sie tylko znak o kodzi ascii
# tzn. 25 + 24 to jest 49 ale sie wyswietli 1
# problemem jest to kiedy wynik jest dwucyfrowy
# bo wtedy trzeba wynik dzielic przez 10  i wypisywac znak po znaku
	
#	movl $0, %esi
#	movb %al, wypisz(,%esi,1)

#	movl $4, %eax
#	movl $1, %ebx
#	movl $wypisz, %ecx	
#	movl $5, %edx

#	int $0x80

	
	popl %ebp
	
	
	ret

