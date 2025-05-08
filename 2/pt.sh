#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

gcc -pthread $scriptDir/src/pt.c -o $scriptDir/bin/pt -lm
time $scriptDir/bin/pt $1