#include <stdio.h>

int n2str(int* tab, int size);

int main(void){
  int tab[] = {10,2,30};
  
  printf("suma = %d\n", n2str(tab, 3));
  

  return 0;
}
