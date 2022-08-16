#!/bin/sh

# Given an integer input, print out the first n fibonacci numbers in sequence.
# Example :
# > ./fibonacci.sh 7
# 0 [ 1 1 2 3 5 8 13 ]

if [ $# -ne 1 ]; then
    echo "Only 1 positive integer argument is required."
    exit 8
fi

prev=0
n=1
echo 1
for (( i=0; i<`expr $1 - 1`; i++ ))
do
    temp=$n
    n=$((n+prev))
    prev=$temp
    echo $n
done