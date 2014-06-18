	#Piotr Konsek	
	#kolokwium podejscie 2

	.type deriv, @function
	.global deriv

	.data
size:
	.long 0
temp:
	.long 0

	.text
deriv:
	pushl %ebp
	movl %esp, %ebp

	#sciaganie ze stosu
	movl 8(%esp), %ebx #ebx = in
	movl 12(%esp), %ecx # ecx = size
	movl 16(%esp), %edx # edx = out

	movl %ecx, size

	#pierwsza wartosc do out[0]
	movl $0, (%edx) # out[0] = 0	
	movl $1, %edi #i=1

loopik:
	pushl %eax
	pushl %ecx

	decl %edi
	movl (%ebx, %edi, 4), %ecx # arg2 = in[i]

	incl %edi
	movl (%ebx, %edi, 4), %eax # arg1 = in[i+1]

	subl %ecx, %eax # eax = arg1 - arg2

	movl %eax, (%edx, %edi,4) #out [i] = eax

	incl %edi # i++
	popl %ecx
	popl %eax
	loop loopik

	
	movl 20(%esp), %eax
	cmpl $1, %eax
	JE koniec #if stopien == 1 to koniec
	

	movl %eax, %ecx # i<stopien
	decl %ecx
	

loop_zew:
	pushl %ecx

	
	movl $1, %edi
	movl size, %ecx #j<size
	movl $0, temp # na poczatek 0 do temp
loopik2:
	pushl %eax
	pushl %ecx

	decl %edi
	movl (%edx, %edi, 4), %ecx # arg2 = in[k]
	pushl %eax
	movl temp, %eax # wpisujemy to co wyliczylismy z poprzedniego do tablicy , nie bedziemy jej wiecej potrzebowac
	movl %eax, (%edx, %edi, 4) 
	popl %eax
	incl %edi
	movl (%edx, %edi, 4), %eax # arg1 = in[k+1]

	subl %ecx, %eax # eax = arg1 - arg2

#	movl %eax, (%edx, %edi,4) #out [k] = eax
# tu sie nadpisuje..
	
	movl %eax, temp #bedziemy wpisywac do temp zeby nie nadpisywac
	
	incl %edi # k++
	
	popl %ecx
	popl %eax
	loop loopik2

	popl %ecx
	loop loop_zew
	

koniec:	
	popl %ebp
	ret
	