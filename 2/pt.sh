#!/bin/bash
gcc -pthread src/pt.c -o bin/pt -lm
time bin/pt $1