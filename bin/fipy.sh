#!/usr/bin/env bash
text=$1
CMD="find ./ -name '*.py' | xargs grep -s $1"
echo $CMD
eval $CMD
