// Chat

#include <stdio.h>

#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/select.h>

#define PORT 5002
#define MAX(x,y) ((x)<(y)?(y) : (x))

typedef struct sockaddr *sad;

int main()
{
	int sock;
	char buff[1024];
	int cto, maxfd;
	struct sockaddr_in sin;
	fd_set in, in_orig;
	socklen_t len;
	
	if(( sock = socket(PF_INET, SOCK_DGRAM,0))<0) error("socket");
	
	sin.sin_family = AF_NET;
	
	sin.sin_port = htons(PORT);
	
	if ( bind(sock, (sad)&sin, sizeof sin) < 0) error("bind");
	
	/* preparamos in_orig */
	
	FD_ZERO(&in_orig);
	FD_SET(0,&in_orig);
	FD_SET(sock,&in_orig);
	maxfd = MAX(0,sock)+1;
	
	for(;;)
	{
		memcpy(&in, &in_orig, sizeof in);
		
		if (select(maxfd, &in, NULL, NULL, NULL) < 0) error("select");
		
		if (FD_ISSET(sock, &in)) 
		{
			if ((cto=recvfrom(sock, buff, sizeof buff, 0, (sad)&sin, &len)) < 0) 
				error("recvfrom");
			buff[cto] = 0;
			printf("%s : %s\n", inet_ntoa(sin.sin_addr), buff);
		}
		
		if (FD_ISSET(0,&in)) 
		{
			char *p;
			
			fgets(buff, sizeof buff, stdin);
			inet_aton(strtok(buff,":"), &sin.sin_addr);
			
			p = strtok(NULL,":");
			
			if (sendto(sock, p, strlen(p), 0, (sad)&sin, sizeof sin) < 0)
				error ("sendto");
		}
	}
	// fin
	
	close(sock);
	return 0;
}
