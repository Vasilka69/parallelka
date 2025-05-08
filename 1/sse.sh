#!/bin/bash
gcc -S src/sse.c -o assembly/sse.s
gcc src/sse.c -o bin/sse
time bin/sse $1