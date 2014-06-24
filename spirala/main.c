//wersja dzialajaca dla macierzy kwadratowych


#include <stdio.h>

extern void fill_tab(long *tab, long n, long m);

int main(void){
  long rows = 4;
  long cols = 4;
  int i,j;

  long tab[rows][cols];

  for(i=0;i<rows;i++)
    for(j=0;j<cols;j++)
      tab[i][j] = 0;

  fill_tab(tab, rows, cols);

  for(i=0;i<rows;i++){
    for(j=0;j<cols;j++)
      printf("%ld ", tab[i][j]);
    printf("\n");
  }



  return 0;

}
