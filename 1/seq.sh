#!/bin/bash
gcc -S src/seq.c -o assembly/seq.s
gcc src/seq.c -o bin/seq
time bin/seq $1a