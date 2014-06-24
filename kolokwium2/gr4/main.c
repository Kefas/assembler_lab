#include <stdio.h>

extern void replace(char *string, char c1, char c2, long *rep_count);

int main(void){
  long rep_count = 0;
  char c1 = 'p';
  char c2 = 'k';
  char string[] = "piotr konsek";

  printf("Było %s\n", string);
  replace(string, c1, c2, &rep_count);
  
  printf("Teraz jest %s\n zamieniono %ld\n", string, rep_count);


  return 0;
}
