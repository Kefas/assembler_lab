#include <stdio.h>

char* order_of(long a, long b, long c, long d);

int main(void){

  char *buf;

  buf = order_of((long)4, (long)3, (long) 2, (long) 1);

  
  printf("%s", buf);
  

  return 0;
}
