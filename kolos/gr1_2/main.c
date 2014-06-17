#include <stdio.h>

extern long digit_count(char* buf, long* digits, long* max_digit);

int main(void){
  long digits[10] = {0,0,0,0,0,0,0,0,0,0};
  long max_digit = 0;
  int i;
  char* buf = "123456789000023423445sdfgsgn348dfkf8332";

  printf("Ilosc cyfr w tekscie to %ld\n",digit_count(buf, digits, &max_digit));
  for(i=0;i<10;i++)
    printf("%d - %ld\n",i, digits[i]);

  printf("max digit to %ld", max_digit);

  return 0;
}
