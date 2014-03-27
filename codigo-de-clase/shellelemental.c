#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main()
{
	char buf[1024];
	for( ; ; ) {
		printf("yes, master..");
		fgets(buf, sizeof(buf), stdin);
		buf[strlen(buf)-1] = 0;
		if(fork() != 0) { /*padre*/
			int status, pid;
			pid = wait(&status);
			printf("%d termino %smente\n", pid, WIFEXITED(status) ? "normal" : "anormal");
		}
		else { /*hijo*/
			execl(buf, buf, NULL);
			perror("exec");
			exit(-1);
		}
	}
	return 0;
}


