#include <stdio.h>

union u {
	int i;
	char c[4];
};

int main()
{
	union u a;
	a.i = 0x12345678;
	printf("el %s endian\n", a.c[0] == 0x12? "big" : "little");
	return 0;
}	
