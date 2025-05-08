#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

gcc -S $scriptDir/src/sse.c -o $scriptDir/assembly/sse.s
gcc $scriptDir/src/sse.c -o $scriptDir/bin/sse
time $scriptDir/bin/sse $1