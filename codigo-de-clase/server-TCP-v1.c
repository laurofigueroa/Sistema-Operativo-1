/* servidor TCP */

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

int main()  /*ejemplo 1 servidor*/
{
    int sock, sock1;
    struct sockaddr_in dir, dir1;
    char buff[1024];
    int cto;
    socklen_t l;
    /*crear el socket*/
    if((sock = socket(PF_INET, SOCK_STREAM, 0)) < 0) error("socket");
    /*direccion de escucha*/
    dir.sin_family = AF_INET;
    dir.sin_port = htons(PORT);
    dir.sin_addr.s_addr = INADDR_ANY;
    /*binding de la direccion */
    if(bind(sock,(sad)&dir, sizeof dir) < 0) error("bind");
    /*indicamos que vamos a escuchar*/
    if(listen(sock, 5) < 0) error("listen");
    /*esperamos conexion*/
    l = sizeof dir1;
    if((sock1 = accept(sock, (sad)&dir1, &l)) < 0) error("accept");
    printf("Llega de (%hu, %s)\n", ntohs(dir1.sin_port), inet_ntoa(dir1.sin_addr));
    /*tratamos sesion*/
    if((cto = read(sock1, buff, sizeof buff)) < 0) error("read");
    buff[cto] = 0;
    printf("[%s]\n", buff);
    buff[0]++;
    if(write(sock1, buff, cto) < 0) error("write");
    /*cerramos sesion*/
    close(sock1);
    /*cerramos todo*/
    close(sock);
    return 0;   
}
