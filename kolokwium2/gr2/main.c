#include <stdio.h>

extern long find_character(char *s,char * c, long * first_occ, long *last_occ);
extern long is_rectangle(long a, long b, long c);

int main(void){

  long first = -1;
  long last = -1;
  char litera = 'a';
  long a = 3;
  long b = 4;
  long c = 5;
  long wynik = is_rectangle(a,b,c);
  
  long l = find_character("asdfsdasdf", &litera, &first, &last);
  printf("Pierwszy wystapienie: %ld, drugie wystąpienie %ld, ilośc : %ld\n", first, last, l);


  printf("Czy %ld %ld %ld jest protokątny? %ld\n", a, b, c , wynik);

  return 0;
  
}
