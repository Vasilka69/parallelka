#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <time.h>
#include <omp.h>

int counter = 0;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *heavy_task() {
    for (int i = 0; i < 1e8; i++) {
        sqrt(i);
    }
}

void openmp(int thread_num) {
    // omp_set_dynamic(0);
    // omp_set_num_threads(thread_num);
    printf("OpenMP threads: %d\n", omp_get_num_threads());
    #pragma omp parallel for num_threads(thread_num)
    for (int i = 0; i < thread_num; i++) {
        heavy_task();
        printf("OpenMP threads: %d\n", omp_get_num_threads());
    }
}

int main(int argc, char** argv) {
    struct timespec start, end;
    if (argc != 2) {
        printf("Неправильное количество аргументов :(");
        return 1;
    }

    int threads_num = atoi(argv[1]);

    openmp(threads_num);
    pthread_mutex_destroy(&mutex);

    return 0;
}