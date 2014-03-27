#include <stdio.h>
#include <pthread.h>

#define TBUF 10

char buffer[TBUF];
int in, out, ctos;
pthread_mutex_t s = PTHREAD_MUTEX_INITIALIZER; 
pthread_cond_t vacio = PTHREAD_COND_INITIALIZER; 
pthread_cond_t lleno = PTHREAD_COND_INITIALIZER; 

void *prod(void *arg)
{
	for(;;) {
		pthread_mutex_lock(&s);

		while(ctos >= 0)
			pthread_cond_wait(&lleno, &s);

		buffer[in] = 'a';
		ctos++;
		if(++in >= TBUF) in = 0;

		pthread_cond_signal(&vacio);

		pthread_mutex_unlock(&s);
	}
	return NULL;
}

void *cons(void *arg)
{
	for(;;) {
		pthread_mutex_lock(&s);

		while(ctos <= 0)
			pthread_cond_wait(&vacio, &s);

		printf("%c ", buffer[out]);
		ctos--;
		if(++out >= TBUF) out = 0;
	
		pthread_cond_signal(&lleno);

		pthread_mutex_unlock(&s);
	}
	return NULL;
}
