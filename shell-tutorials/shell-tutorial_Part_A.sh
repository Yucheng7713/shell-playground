#!/bin/sh -x

# The first line is called "Sha-bang" coming along with the path of interpreter which will read all commands in the script.
# The option "-x" means debug mode.

# Contents :
# 1. If statement
# 2. Loop statement (for & while)
# 3. Special annotation (e.g. $#, $?, $@)


# If conditional statement.
#---------------------------------------------------------------------------------------------------------------------------------
if [ $# -ne 3 ]; then
    echo "Argument not found. Usage : shell-tutorial.sh <NUM> <STRING> <STRING>"
    exit 1
fi

# The above if statement is equal to below
#if test $# -ne 3; then
#   echo "Argument not found. Usage : shell-tutorial.sh <NUM> <STRING> <STRING>"
#   exit 1
#fi

# If-statement option
# -eq : equal
# -ne : not equal
# -ge : greater than or equal
# -gt : greater than
# -d : if a file exists and it is a directory.
# -f : if a file exists and it is a regular file.
# -r : if a file exists and it is readable.
# -z : true if length of string is zero.

# Loop statmenet
#---------------------------------------------------------------------------------------------------------------------------------
# For loop
for (( i=0; i<$1; i++ ))
do
    echo "For loop printing second argument : "$2
done

# While loop
count=0
while [ $count -ne $1 ]
do
    echo "While loop printing second argument : "$2
    count=$((count+1))
done

# Until loop
i=0
until [ $i -gt 10 ]
do
    echo $i
    i=$((i+1))
done

### Special annotation.
#---------------------------------------------------------------------------------------------------------------------------------
# The number of arguments passed to this script.
echo "The input number of arguments = "$#

# All arguments (non-divided) passed to this script.
echo "The input arguments(Unsplitted) : "$*

# All arguments (divided) passed to this script.
echo "The input arguments(Divided) : "$@

# Iterate through '$@' with for loop
echo "Iterate through $@ with for loop"
count=1
for args in $@
do
    echo "[${count}]. argument : ${args}"
    count=$((count+1))
done

# The exit status of the last executed command/statement.
echo "The previous statement (echo all arguments)'s execution status > ${?}"

# The current PID
echo "The current \$PID > ${$}"