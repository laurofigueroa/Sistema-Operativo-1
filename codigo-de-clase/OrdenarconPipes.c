#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>


char *arr[] = { "esta" , "es", "una", "p...", "prueba", NULL };
int cto;

/* podemos usar el sort que viene con un poco de redirecion */
int mainNOFUNCIONA() {
    int pip[2];
    pipe(pip);
    if (fork()) { /*padre*/
        int i; char buff[1024];
        for(i = 0; arr[i] != NULL; i) {
            write(pip[1], arr[i], strlen(arr[i]));
            write(pip[1], "\n", 1);
        }
        close(pip[1]);
        while(cto = read(pip[0], buff, sizeof (buff))>0) {
                buff[cto] = 0;
                printf("%s \n",buff);
        }
        close(pip[0]);
        wait(NULL);
    }
    else { /* hijo */
        close(0); dup(pip[0]); close(pip[0]);
        close(1); dup(pip[1]); close(pip[1]);
        execl("/usr/bin/sort", "sort", NULL);
        exit(-1);
    }
    return 0;
}

int main()
{
    int pip[2], piphp[2];
    pipe(pip); pipe(piphp);
    if (fork()) { /*padre*/
        close(piphp[0]); close(piphp[1]);
        int i; char buff[1024];
        for(i = 0; arr[i] != NULL; i) {
            write(piphp[1], arr[i], strlen(arr[i]));
            write(piphp[1], "\n", 1);
        }
        close(piphp[1]);
        while(cto = read(piphp[0], buff, sizeof (buff))>0) {
                buff[cto] = 0;
                printf("%s \n",buff);
        }
        close(piphp[0]);
        wait(NULL);
    }
    else { /* hijo */
        close(piphp[1]); close(piphp[0]);
        close(0); dup(piphp[0]); close(piphp[0]);
        close(1); dup(piphp[1]); close(piphp[1]);
        execl("/usr/bin/sort", "sort", NULL);
        exit(-1);
    }
    return 0;
}
