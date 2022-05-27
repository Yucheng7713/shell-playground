#!/bin/bash
# Installation guide : install ./sha-validate.sh /usr/local/bin/sha-validate

# Number of args validation
if [ $# -ne 3 ]; then
    echo "Number of arguments : $# is not equal to 3."
    exit 8
fi

# Readibility validation
if [ ! -r $2 ]; then
    echo "Downloaded file at $2 is not readable."
    exit 8
fi

# SHA256 or SHA512
if [ $1 -ne 256 ] && [ $1 -ne 512 ]; then
    echo "Invalid SHA encryption assigned : $1"
    exit 8
fi

SUMCHECK=$3
CHECKRESULT=`shasum -a $1 $2 | awk '{print $1}'`

# If the shasum command fails.
if [ $? -ne 0 ]; then
    echo "Checksum check failed."
    exit 8
fi

# Check if given SHA256 checksum is equal or not.
if [ ! "$SUMCHECK" = "$CHECKRESULT" ]; then
    echo "Checksum not matched, Failed."
    echo "<!!WARNING> THE DOWNLOADABLE IS SUSPICIOUS."
    exit 8
fi

echo "Checksum matched, Successed."
exit 0
