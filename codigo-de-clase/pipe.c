#include <stdio.h>
#include <unistd.h>

int main() 
{
	int pip[2];
	char buf[1024];
	pipe(pip); //pip[0] lectura, pip[1] escribir
	write(pip[1], "hola mundo\n", 12);
	read(pip[0], buf, sizeof buf);
	printf("%s", buf);
	close(pip[0]); close(pip[1]);
	return 0;
}
