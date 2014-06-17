#include <stdio.h>

extern long reverse_tab_arg(long* tab,  long n,  long* even_num_count);

int main(void){

  long tab[6] = {1,2,3,4,5,6};
  long count = 5;
  int i;
  long num_count = 0;

  printf("Tablica:");
  for(i=0;i<count;i++)
    printf(" %ld ,", tab[i]);
  printf("\n");



  printf("Srednia z tablicy powinna byc 15/5 a jest: %ld\n", reverse_tab_arg(tab, count, &num_count));

  printf("Tablica odwrocona:");
  for(i=0;i<count;i++)
    printf(" %ld ,", tab[i]);
  printf("\n");

  return 0;
}
