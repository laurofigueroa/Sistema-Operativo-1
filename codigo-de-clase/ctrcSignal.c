#include <stdio.h>
#include <signal.h>

typedef void(*PFIV)(int);

PFIV signal(int sig, PFIV f);

void ctrlc(int sig)
{
    static int ctas;
    if(++ctas > 5)
        signal(SIGINT, SIG_DFL);
}

int main() 
{
    signal(SIGINT, ctrlc);
    for(;;);
    return 0;
}
