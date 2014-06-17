#include <stdio.h>

extern long digits_count(char *buf, long *digits, long *max_digit);
/* dostaje wskaznik do lancucha znakow, ma zwrocic liczbe cyfr jaka sie wsrod tych znakow pojawila
digits - tablica liczebnosci znakow
max_digit - najczestsza liczba
*/
int main(void){
  char bufor[] = { 'a', '9', '3', 'b'};
  long dig[10] ={0, 0, 0, 0, 0, 0 ,0, 0, 0, 0} ;
  long max_dig;

  printf("Wynik to %l\n", digits_count(bufor, dig, &max_dig));

  return 0;
}
