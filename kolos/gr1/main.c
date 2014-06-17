#include <stdio.h>

extern long digits_count(char *buf, long* digits, long* max_digit);

int main(void){
  long digits[] = {0,0,0,0,0,0,0,0,0,0};
  long max_digit;
  char *buf = "123asb123asdvb23444423423988731";
  int i;
  long result=0;

  result = digits_count(buf, digits, &max_digit);
  
  for(i=0;i<10;i++)
    printf("liczba %d : %ld\n", i, digits[i]);

  printf("Najwiecej razy pojawila sie liczba: %ld\n", max_digit);
  printf("Ilosc cyfr: %ld\n", result);


  return 0;
}
