#include <stdio.h>
#include <unistd.h>

int main() 
{
	int pip[2];
	pipe(pip);
	if(fork() != 0) {
		write(pip[1], "hola mundo\n", 12);
		wait(NULL);
	}
	else {
		char buff[1024];
		read(pip[0], buff, sizeof(buff));
		printf("%s", buff);
	}
	return 0;
}
