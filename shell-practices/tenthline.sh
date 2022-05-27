#!/bin/sh

# file.txt
# Line 1
# Line 2
# Line 3
# Line 4
# Line 5
# Line 6
# Line 7
# Line 8
# Line 9
# Line 10

if ! [ $# -gt 1 ]; then
    echo "Missing arguments"
    exit 8
fi

# Get number of lines in file
lines=$(cat $1 | wc -l)
echo $lines

# The below case only works when the n is smaller than the total lines in the file.
# If n is greater, then it would anyway return the last line.
if [ $2 -gt $lines ]; then
    invalid=$(cat $1 | head -n $2 | tail -n 1)
    echo "Invalid case > "$invalid""
fi

# For handling such case, instead getting first n lines at first, get the last n lines instead.
# if n is greater, then the 2nd statmenet will return empty string.
# at the end give empty result as there is no enough lines to query.
valid=$(cat $1 | tail -n +$2 | head -n 1)
echo "Valid case > "$valid""