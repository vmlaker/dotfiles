#!/usr/bin/env bash
path=$1
CMD="find $path -type f -not -wholename '*.svn*'"
echo $CMD
eval $CMD
