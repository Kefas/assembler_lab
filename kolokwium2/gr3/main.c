#include <stdio.h>

extern double volume(double r,double h);
extern void fill_tab(long * tab, long m, long n, long swit);

int main(void){

  double promien = 3.5;
  double wysokosc = 1.0;
  long rows = 5;
  long cols = 5;
  int i,j;
  long tab[rows][cols];

for(i=0;i<rows;i++)
    for(j=0;j<cols;j++)
      tab[i][j] = 0;
    
  


  printf("Walec o promieniu %f, i wysokosci %f ma objetosc %f\n", promien, wysokosc, volume(promien, wysokosc));

  printf("Tabliczka czegos\n");

  fill_tab(tab, rows, cols, (long) 2);
  for(i=0;i<rows;i++){
    for(j=0;j<cols;j++)
      printf("%ld ", tab[i][j]); 
    printf("\n");
  }




  return 0;
}
