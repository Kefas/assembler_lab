//---------------------------------------------------------------
// Program lab_6b - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_6b lab_6b.c lab_6b_asm.s
// To run:          ./lab_6b
//
//---------------------------------------------------------------

#include <stdio.h>

int fib( unsigned int k )
{
	if( k == 0 )
		return 0;
	else if( k == 1 )
		return 1;
	else
		return fib( k - 2 ) + fib( k - 1 );
}

int fib_iter(unsigned int k){
  int i, old_v=0,new_v=1;
  int v =0;
  for(i = 1; i<k ;i++){
    v = old_v + new_v;
    old_v = new_v;
    new_v = v;
  }
  return v;
}


void main( void )
{
 int i;

 for( i = 0; i <= 30; i++ )
   printf( "Fib( %2d ) = %d FibA= %d\n", i, fib_iter( i ), fibai( i ) );
}
