#!/bin/sh

# words.txt :
#   the day is sunny the the
#   the sunny is is
# Return :
#   the 4
#   is 3
#   sunny 2
#   day 1

cat $1 | tr -s ' ' '\n' | sort | uniq -c | sort -r | awk '{print $2, $1}'

# Explanation
# > ./wordcount.sh ./words.txt
# tr -s ' ' '\n'        --> Replace all blanks into newlines for splitting all words
# sort                  --> Sort each line to have same words align consecutively.
# uniq -c               --> Count each word then have all unique words listed. (including their counts.)
# sort -r               --> Sort each line reversly.
# awk '{print $2, $1}'  --> Print out each line of result.

# Appendix
# Difference between 'tr' and 'tr -s'
# > echo "hello world" | tr "l" "z"
# hezzo worzd
# > echo "hello world" | tr -s "l" "z"
# hezo worzd
# '-s' option will squeeze all occurances of the replaced character into one.