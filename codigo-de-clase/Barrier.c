#include "Barrier.h"

Barrier_t barrier_create(unsigned ctas)
{
	Barrier_t ret;
	ret = malloc(sizeof(*ret));
	ret->ctas = ctas;
	ret->actuales = 0;
	pthread_mutex_init(&ret->s, 0); 
	pthread_cond_init(&ret->c, 0);
	return ret;
}

void barrier_free(Barrier_t b)
{
	pthread_cond_broadcast(&b->c);
	free(b);
}

void barrier_arrive(Barrier_t b)
{
	pthread_mutex_lock(&b->s);
	b->actuales++;
	if(b->actuales < b->ctas)
		pthread_cond_wait(&b->c, &b->s);
	pthread_cond_broadcast(&b->c); 	// pthread_cond_signal(&b->c);
	b->actuales = 0; 		// actuales--;
	pthread_mutex_unlock(&b->s);
}

