#include <stdio.h>
#include <stdlib.h> /* for atoi */

/* could use an unsigned int to further reduce troublemakers */
int fib(int n){
	if(n<=1) return (n>0);
	return fib(n-2) + fib(n-1);
}
/* negative fib numbers exist but are not calculated by this program */

int main(int argc, char** argv){
	int x;
	if(argc >= 2){
		x = atoi(argv[1]);
	} else {
		printf("Fibonacci number: ");
		scanf("%d", &x);
	}

	printf("Fibonacci(%d): %d\n", x, fib(x));
}
