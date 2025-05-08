#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void seq(float a[], float b[], float c[]) {
    for (int i = 0; i < 4; i++) {
        c[i] = a[i] * b[i];
    }
    // for (int i = 0; i < 4; i++) {
    // printf("%f ", c[i]);
    // }
    // printf("\n");
}

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("Неправильное количество аргументов :(");
        return 1;
    }

    int iterations_num = atoi(argv[1]);
    if (iterations_num <= 0) {
        printf("Введите положительное целое число аргументов.\n");
        return 1;
    }

    float a[4] = {1.0, 2.0, 3.0, 4.0};
    float b[4] = {5.0, 6.0, 7.0, 8.0};
    float c[4];

    for (int i = 0; i < iterations_num; i++) {
        seq(a, b, c);
    }

    return 0;
}