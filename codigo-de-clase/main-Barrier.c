#include <stdio.h>
#include <stdlib.h>
#include "Barrier.h"

Barrier_t b;

void *f(void *arg)
{
	int id = *(int*)arg;
	sleep(random()%10);
	printf("%d antes de barrera\n",id);
	barrier_arrive(b);
	printf("%d sale de la barrera\n",id);
	return NULL;
}

#define N 50

int main() 
{
	pthread_t t[N];
	int args[N], i;
	b = barrier_create(N);

	for(i=0; i<N; i++) {
		args[i] = i;
		pthread_create(&t[i], 0, f, &args[i]);
	}
	for(i=0; i<N; i++)
		pthread_join(t[i], NULL);

	barrier_free(b);
	return 0;
}
	

