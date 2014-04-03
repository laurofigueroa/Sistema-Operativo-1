#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define PORT    5000

typedef struct sockaddr *sad;

void error(char *s)
{
    exit((perror(s), -1));
}

int main()      /*ejemplo 2 cliente*/
{
    int sock;
    struct sockaddr_in dir;
    char buff[1024];
    int cto;
    /*crear socket*/
    if((sock = socket(PF_INET, SOCK_STREAM, 0)) < 0)
        error("socket");
    /*dir. del servidor*/
    dir.sin_family = AF_INET;
    dir.sin_port =  htons(PORT);
    inet_aton("127.0.0.1", &dir.sin_addr);
    /*conectamos*/
    if(connect(sock, (sad)&dir, sizeof dir) < 0)
        error("connect");
    /*tratamos sesion*/
    if(write(sock, "hola mundo!", 11) < 0) error("write");
    if((cto = read(sock, buff, sizeof buff)) < 0) error("read");
    buff[cto] = 0;
    printf("[%s]\n", buff);
    /*terminamos*/
    close(sock);
    return 0;
}
