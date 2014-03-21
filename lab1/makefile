lab1 : lab_1.s
	as -o lab_1.o lab_1.s
	ld -o lab_1 lab_1.o

dbg : lab_1.s
	as -gstabs -o lab_1.o lab_1.s
	ld -o lab_1dbg lab_1.o 	

clean:
	rm -f *.o
	rm -f *.bak
	rm -f *~		