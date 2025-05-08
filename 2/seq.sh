#!/bin/bash
gcc src/seq.c -o bin/seq -lm
time bin/seq $1