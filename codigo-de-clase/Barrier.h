#ifndef	__BARRIER_H__
#define __BARRIER_H__
 
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

typedef struct {
	pthread_mutex_t s;
	pthread_cond_t c;
	unsigned ctas, actuales;
} *Barrier_t;

Barrier_t barrier_create(unsigned ctas);
void barrier_free(Barrier_t);
void barrier_arrive(Barrier_t);

#endif	
