	.type digits_count, @function
	.global digits_count
	.data
buf:
	.ascii "%d\n"
	.text
	#long digits_count(char *buf, long *digits, long *max_digit)


digits_count:
	#zabezpieczamy zawartosc ebp
	push %ebp
	movl %esp,%ebp

	#sciagamy ze stosu adres tablicy charow
	movl 8(%ebp),%ebx 		#adres tab charow do ebx
	movl $0,%ecx 			# 0 do licznika petli
loopik:
	#pushl (%ebx,%ecx,4)
	#pushl $buf
	#call printf
	#addl $8, %esp
	
	cmpl $'0',(%ebx,%ecx,4) 	#aktualny element ebx +ecx*4
	jge nie_liczba
	cmpl $'9',(%ebx,%ecx,4) 	
	jb nie_liczba

	

	#wybrane liczby
	movl (%ebx,%ecx,4),%eax
	subl $'0', %eax			# %eax - 48
	pushl %eax
	pushl %ebx
	
	movl 12(%ebp,%eax,4), %ebx		 # inkrementacja licznika cyfr
	movl 16(%ebp), %eax			# indeks jest zarowno cyfra

	incl (%ebx)
	incl (%eax)

	popl %ebx
	popl %eax
	
nie_liczba:
	incl %ecx 			#ecx++
	cmpl $0,%ebx 			# if == '\0'
	jne loopik 

	#znajdujemy maxa
	movl $0,%eax # max = 0
	movl $8,%ecx
	
znajdz_max:
	cmpl 8(%ebp,%ecx,4),12(%ebp,%ecx,4)
	jae next #nic z tego
	movl $9,%eax
	subl %ecx, %eax #w eax bedzie cyfra 9-eax
next:
	loop znajdz_max
	movl 16(%ebp),%ebx
	movl %eax, (%ebx)
	
	popl %ebp
	leave
	ret
	