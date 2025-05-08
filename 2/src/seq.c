#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

int counter = 0;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void heavy_task(int thread_num) {
    printf("\tThread #%d started\n", thread_num);
    pthread_mutex_lock(&mutex);
    printf("\t\tThread #%d acquired mutex\n", thread_num);
    counter++;
    printf("\t\t\tThread #%d, counter: %d\n", thread_num, counter);
    printf("\t\tThread #%d released mutex\n", thread_num);
    pthread_mutex_unlock(&mutex);

    for (int i = 0; i < 1e8; i++) {
        sqrt(i);
    }
    printf("\tThread #%d finished\n", thread_num);
}

void sequential(int threads_num) {
    for (int i = 0; i < threads_num; i++) {
        printf("MAIN: starting thread %d\n", i);
        heavy_task(i);
    }
}

int main(int argc, char** argv) {
    struct timespec start, end;
    if (argc != 2) {
        printf("Неправильное количество аргументов :(");
        return 1;
    }

    int threads_num = atoi(argv[1]);
    sequential(threads_num);

    return 0;
}