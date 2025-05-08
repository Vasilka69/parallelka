#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

gcc -fopenmp $scriptDir/src/omp.c -o $scriptDir/bin/omp -lm
time $scriptDir/bin/omp $1