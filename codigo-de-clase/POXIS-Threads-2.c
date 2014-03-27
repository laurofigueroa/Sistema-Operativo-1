#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t sem = PTHREAD_MUTEX_INITIALIZER;
void *f(void *arg)
{
	int id = *(int*)arg;
	static int cosa; /* compartido */
	for(;;) { 
		/* región crítica, se necesita exclucion mutua 
		* un solo thread lo puede ejecutar al mismo tiempo*/
		cosa = id;
		pthread_mutex_lock(&sem);

		/* algo importante y largo */
		sleep(1);
		printf("%d: %s\n", id, cosa==id? "bien":"aggh!");
		pthread_mutex_unlock(&sem);
	}
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
