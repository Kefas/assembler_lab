#include <stdio.h>

extern void deriv(long *in, long n, long *out, long m);

// na wejsciu tablica liczb calkowitych zawierajaca n elementow, nalezy policzyc roznice miedzy tymi elementami tak zeby
// out[i+1] \ in[i+1] - in[i]
// out[0] = 0

//zadanie na 3.0 !!

//

int main(void){
  long input[6] = {1,3,10,41,50,60};
  long size_in = 6;
  long out[6] = {0,0,0,0,0};
  long stopien = 0;
  int i;
  
  deriv(input, size_in, out, stopien);

  for(i =  0; i<6;i++)
    printf("el %d = %ld\n", i, out[i]); 


  return 0;
}
