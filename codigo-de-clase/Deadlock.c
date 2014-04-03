#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t n = PTHREAD_MUTEX_INITIALIZER;

void *f(void *a)
{
	printf("f:lock m\n");
	pthread_mutex_lock(&m);
	sleep(1);
	printf("f:lock n\n");
	pthread_mutex_lock(&n);
	pthread_mutex_unlock(&n);
	pthread_mutex_unlock(&m);
	printf("f:fin\n");		
	return NULL;
}


void *g(void *a)
{
	printf("g:lock n\n");
	pthread_mutex_lock(&n);
	sleep(1);
	printf("f:lock m\n");
	pthread_mutex_lock(&m);
	pthread_mutex_unlock(&m);
	pthread_mutex_unlock(&n);
	printf("g:fin\n");		
	return NULL;
}
int main()
{
	pthread_t tf,tg;
	pthread_create(&tf,0,f,NULL);
	pthread_create(&tg,0,g,NULL);
	pthread_join(tf,NULL);
	pthread_join(tg,NULL);
	return 0;
}
