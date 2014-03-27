#include <stdio.h>
#include <pthread.h>

/* funcion para los threads */
void *f(void *arg)
{
	int id = *(int*)arg;
	for(;;) printf("%d ",id);
	return NULL;
}

int main()
{
	pthread_t t1, t2;
	int arg[2];

	arg[0]=1; pthread_create(&t1, 0, f, &arg[0]);
	arg[1]=2; pthread_create(&t2, 0, f, &arg[1]);
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	return 0;
}
