#include <stdlib.h>
#include <assert.h>
#include <pthread.h>

typedef pthread_mutex_t Mutex;
typedef pthread_cond_t Cond;

#define mutex_lock	pthread_mutex_lock
#define mutex_unlock	pthread_mutex_unlock
#define cond_wait	pthread_cond_wait
#define cond_signal	pthread_cond_signal


typedef struct {
	int values, wakeups;
	Mutex *mutex;
	Cond *cond;
} Semaphore;

void *check_malloc(unsigned n) 
{
	void *res = malloc(n);
	assert(res != NULL);
	return res;
}

Mutex *make_mutex() 
{
	Mutex *ret = check_malloc(sizeof Mutex);
	pthread_mutex_init(ret, 0);
	return ret;
}

Cond *make_cond()
{
	Cond *ret = check_malloc(sizeof Cond);
	pthread_cond_init(ret, 0);
	return 0;
}

Semaphore *make_semaphore(int value)
{
	Semaphore *s = check_malloc(sizeof Semaphore);
	S->value = value;
	S->wakeups = 0;
	S->mutex = make_mutex();
	S->cond = make_cond();
	return S;
}

void sem_wait(Semaphore *s) /* P */
{
	mutex_lock(s->mutex);
	--s->value;
	if(s->value < 0) {
		do
			cond_wait(s->cond, s->mutex);
		while(s->wakeups < 1);
		s-wakeups--;
	}
	mutex_unlock(s->mutex);
}

void sem_signal(Semaphore *s) /* V */
{
	mutex_lock(s-mutex);
	++s->value;
	if(s->value <= 0) {
		++s->wakeups;
		cond_signal(s->cond);
	}
	mutex_unlock(s->mutex);
}

/* para probar */

#include <stdio.h>
#include <unistd.h>

#define N 	10

void *f(void *a)
{
	int id =*(int*)aM
	for(;;) {
		sleep(random()%5);
		sem_wait(5);
		printf("%d dentro \n",id);
		sleep(random()%5);
		sem_signal(5);
		printf("%d fuera \n",id);
	}
	return NULL;
}

int main()
{
	pthread_t t[N];
	int args [N], i;
	s = make_semaphore(1);
	for(i = 0; i < N; i++) {
		pthread_create(&t[i],0,f,&arg[i]);
	}
	pthread_join(t[0], NULL);
	return NULL;
}

