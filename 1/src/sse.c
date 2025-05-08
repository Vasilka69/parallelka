#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void sse(float a[], float b[], float c[]) {
    asm volatile (
                    "movups %[a], %%xmm0\n"
                    "movups %[b], %%xmm1\n"
                    "mulps %%xmm1, %%xmm0\n"
                    "movups %%xmm0, %[c]\n"
                    :
                    : [a]"m"(*a), [b]"m"(*b), [c]"m"(*c)
                    : "%xmm0", "%xmm1");
    // for (int i = 0; i < 4; i++) {
    //     printf("%f ", c[i]);
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
        sse(a, b, c);
    }

    return 0;
}