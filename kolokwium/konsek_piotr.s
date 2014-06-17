

.data

.text

	#long digits_count(char*, long *, long *)
.global digits_count
.type digits_count,@function

	digits_count:
	push %ebp
	movl %esp,%ebp
	movl 8(%ebp),%ebx #ebx=*buf
	movl $0,%ecx #licznik do ecx
	movl $0,%edx
petla:
	movl (%ebx,%ecx,4),%eax
	cmpl $'0',%eax # ebx + ecx * 4
	jge not_n
	movl (%ebx,%ecx,4),%eax
	cmpl $'9',%eax 
	jb not_n

	NOP
	
	movl (%ebx,%ecx,4),%eax
	subl $48,%eax	#char na inta
	pushl %eax
	movl 12(%ebp,%eax,4),%eax # inkrementowanielicznikacyfry
	incl (%eax) #zwiekszenie sumy cyfr
	incl %edx 
	popl %eax
not_n:
	incl %ecx # zwiekszenie licznika petli
	cmpl $0,%ebx # == \0
	jne petla

	NOP
	
	movl $0,%eax #max== 0
	movl $8,%ecx
max:
	movl 8(%ebp,%ecx,4),%ebx
  	cmpl %ebx,12(%ebp,%ecx,4)
	jae next 
	movl $9,%eax
	subl %ecx,%eax 
next:
	loop max   
	movl 16(%ebp),%ebx
	movl %eax, (%ebx)
	movl %edx,%eax #return

	popl %ebp
	leave
	ret
	