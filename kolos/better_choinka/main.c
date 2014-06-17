#include <stdio.h>

extern void choinka(long* n, char* c);

int main(void){
  long size = 10;
  char c = '*';

  choinka(&size, &c);


  return 0;
}
