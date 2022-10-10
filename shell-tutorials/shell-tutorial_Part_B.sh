#!/bin/sh -x

# Contents :
# 1. External sourcing
# 2. Function
# 3. Arithmatic expression
# 4. File input
# 5. Regex string matching


# External sourcing
#---------------------------------------------------------------------------------------------------------------------------------
# Import the external configuration or script into the shell.
# As CONFIG_VAR_1 and CONFIG_VAR_2 are not defined here but by sourcing them from conf file
# they could be referred as below : ( Not just variable but defined function could also be imported in the same way.)
source ./confs/shell-tutorial_Part_B.conf
echo $CONFIG_VAR_1
echo $CONFIG_VAR_2

# Function
#---------------------------------------------------------------------------------------------------------------------------------
# Function defining
test() {
    # All special argument notations will be subjected to the function rather than the script.
    # For instance, $1 will not get the first argument passing to this shell but the one pass to the function.
    source $1
    echo $CONFIG_VAR_1
    echo $CONFIG_VAR_2
}

# Function invocation
test ./confs/shell-tutorial_Part_B.conf


# Arithmatic expression
#---------------------------------------------------------------------------------------------------------------------------------
# In shell, there are two ways to do arithmatic expression :
# $((n+1)) 
# `expr $n + 1` - !! If no space between each argument, the result will be given as "$n+1"
# Work in both Shell (#!/bin/sh) and Bash (#!/bin/bash)
n=0
n=$((n+10))
n=`expr $n + 10`


# Get the file content and store it to a variable.
#---------------------------------------------------------------------------------------------------------------------------------
input=`cat $1`
echo $input


# Regex string matching
#---------------------------------------------------------------------------------------------------------------------------------
re='^[0-9]+$'
if ! [[ "$2" =~ $re ]]
  then
    echo "2nd argument is non-numeric."
    exit 1 
fi