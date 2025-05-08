# Лабараторная работа №2

В ходе работы были рассмотрены два программы, выполняющие вычисление квадратного корня различных чисел. Первая программа решает эту задачу последовательно, вторая - параллельно при помощи pthreads.

### Результаты выполнения программ на 8 потоках
```
$ ./seq.sh 8
MAIN: starting thread 0
        Thread #0 started
                Thread #0 acquired mutex
                        Thread #0, counter: 1
                Thread #0 released mutex
        Thread #0 finished
MAIN: starting thread 1
        Thread #1 started
                Thread #1 acquired mutex
                        Thread #1, counter: 2
                Thread #1 released mutex
        Thread #1 finished
MAIN: starting thread 2
        Thread #2 started
                Thread #2 acquired mutex
                        Thread #2, counter: 3
                Thread #2 released mutex
        Thread #2 finished
MAIN: starting thread 3
        Thread #3 started
                Thread #3 acquired mutex
                        Thread #3, counter: 4
                Thread #3 released mutex
        Thread #3 finished
MAIN: starting thread 4
        Thread #4 started
                Thread #4 acquired mutex
                        Thread #4, counter: 5
                Thread #4 released mutex
        Thread #4 finished
MAIN: starting thread 5
        Thread #5 started
                Thread #5 acquired mutex
                        Thread #5, counter: 6
                Thread #5 released mutex
        Thread #5 finished
MAIN: starting thread 6
        Thread #6 started
                Thread #6 acquired mutex
                        Thread #6, counter: 7
                Thread #6 released mutex
        Thread #6 finished
MAIN: starting thread 7
        Thread #7 started
                Thread #7 acquired mutex
                        Thread #7, counter: 8
                Thread #7 released mutex
        Thread #7 finished

real    0m1.328s
user    0m1.297s
sys     0m0.000s
```
```
$ ./pt.sh 8
MAIN: starting thread 0
MAIN: starting thread 1
        Thread #0 started
                Thread #0 acquired mutex
                        Thread #0, counter: 1
                Thread #0 released mutex
        Thread #1 started
                Thread #1 acquired mutex
                        Thread #1, counter: 2
                Thread #1 released mutex
MAIN: starting thread 2
MAIN: starting thread 3
        Thread #2 started
                Thread #2 acquired mutex
        Thread #3 started
                        Thread #2, counter: 3
                Thread #2 released mutex
MAIN: starting thread 4
                Thread #3 acquired mutex
                        Thread #3, counter: 4
                Thread #3 released mutex
MAIN: starting thread 5
        Thread #4 started
                Thread #4 acquired mutex
                        Thread #4, counter: 5
                Thread #4 released mutex
        Thread #5 started
MAIN: starting thread 6
MAIN: starting thread 7
        Thread #6 started
        Thread #7 started
                Thread #5 acquired mutex
                        Thread #5, counter: 6
                Thread #5 released mutex
                Thread #6 acquired mutex
                        Thread #6, counter: 7
                Thread #6 released mutex
                Thread #7 acquired mutex
                        Thread #7, counter: 8
                Thread #7 released mutex
        Thread #2 finished
        Thread #4 finished
        Thread #1 finished
        Thread #5 finished
        Thread #0 finished
        Thread #3 finished
        Thread #7 finished
        Thread #6 finished

real    0m0.297s
user    0m2.271s
sys     0m0.010s
```

Разница во времени выполнения: 1.328 / 0.297 = 4.471380471380471  
Как уже сказано выше, во втором случае задачи выполняются параллельно и не дожидаются выполнения предыдущих. За счет этого и была получена такая разница во времени выполнения.
