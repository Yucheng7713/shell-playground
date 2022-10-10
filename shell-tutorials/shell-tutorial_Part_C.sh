#!/bin/sh -x

# Contents :
# 1. Execution mode setting
# 2. I/O Redirection


### Execution mode under error case
#---------------------------------------------------------------------------------------------------------------------------------
# Default : Continue script execution if exit code != 0
set +e

# Stop script execution if exit code != 0
set -e

### I/O Redirection
#---------------------------------------------------------------------------------------------------------------------------------
# Overwrite content to a file entirely.
ls > file.txt

# Append new content to a file
ls >> file.txt

# Feed sort command with content from file.txt
sort < file.txt

# Pipe the standard output of a command to the standard input of another command
echo "Hellow World" | less

# Feed standard input to a file
1>file.txt

# Feed standard error to a file
2>file.txt