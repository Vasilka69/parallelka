#!/bin/bash
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

gcc $scriptDir/src/seq.c -o $scriptDir/bin/seq -lm
time $scriptDir/bin/seq $1