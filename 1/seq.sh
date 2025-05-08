#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

gcc -S $scriptDir/src/seq.c -o $scriptDir/assembly/seq.s
gcc $scriptDir/src/seq.c -o $scriptDir/bin/seq
time $scriptDir/bin/seq $1a