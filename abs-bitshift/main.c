#include <stdio.h>
#include <stdlib.h> /* for atoi */

/* challenge: no if statements */
int bit_abs(int n){
	/* bitshift right in GCC is arithmetic shift, not logical one (meaning it sign extends) */
	return ((n>>31) * 2 + 1) * n;
	/* more efficient: https://stackoverflow.com/questions/9772348/get-absolute-value-without-using-abs-function-nor-if-statement/9772647#9772647 */
}

int main(int argc, char** argv){
	int x;
	if(argc >= 2){
		x = atoi(argv[1]);
	} else {
		printf("Absolute value of: ");
		scanf("%d", &x);
	}

	printf("abs(%d): %d\n", x, bit_abs(x));
}
