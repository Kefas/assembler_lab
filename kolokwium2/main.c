#include <stdio.h>

extern void deriv(long *in, long n, long *out, long m);

// na wejsciu tablica liczb calkowitych zawierajaca n elementow, nalezy policzyc roznice miedzy tymi elementami tak zeby
// out[i+1] \ in[i+1] - in[i]
// out[0] = 0

//zadanie na 3.0 !!

//

int main(void){
  long input[6] = {1,3,10,20,50,82};
  long size_in = 6;
  long out[6] = {0,0,0,0,0};
  long stopien = 1;
  int i;
 
  printf("Tablica in:\n");  
  for( i=0;i<6;i++)
    printf("%d = %ld\n", i ,input[i]);
 

  printf("\nStopien %d\n", stopien);
  deriv(input, size_in, out, stopien);

 
  printf("\nTablica out\n");
  for(i =  0; i<6;i++)
    printf("el %d = %ld\n", i, out[i]); 



  return 0;
}
