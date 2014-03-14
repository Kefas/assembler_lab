		#----------------------------------------------------------------
# Program lab_0a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0a.o lab_0a.s
#  To link:    ld -o lab_0a lab_0a.o
#  To run:     ./lab_0a
#
#----------------------------------------------------------------

# . dyrektywy assemblera (zmienia sposób działania kompilatora)
	
.data #< wskazuje ze od tego obszaru znajduja sie dane(zmienne)
	
dummy:	#< etykieta = adres miejsca ktore ta etykieta poprzedza (adres bajtu o wartosci 0)
	.byte	0x00 #< .byte nie jest typem, ale to oznacza ze dummy ma rozmiar jednego bajta. 

.text #< kod programu 
.global _start	#< wskazanie symboli globalnych - widocznych na zewnatrz modułu
	
_start:
	JMP	_start
