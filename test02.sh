#!/bin/dash
# test Multiple Commands

seq 1 30 | 2041 slippy -n '/.1/p;/9/s/.//;/.9/p;30q' >> sample
seq 1 30 | python3 -s -S slippy -n  '/.1/p;/9/s/.//;/.9/p;30q' >> output

seq 1 30 | 2041 slippy '/4$/,/9$/d;5,7p' >> sample
seq 1 30 | python3 -s -S slippy '/4$/,/9$/d;5,7p' >> output

seq 1 30 | 2041 slippy -n '1p;/5/s/.//;/.2/p;30q' >> sample
seq 1 30 | python3 -s -S slippy -n '1p;/5/s/.//;/.2/p;30q' >> output

diff -u sample output >difference
if [ "$?" -eq 1 ]
then
    cat difference
    echo "\033[31mTest Failed\033[0m"
    rm output sample difference 2> /dev/null
    exit 1
else
    echo "\033[32mTest Passed\033[0m"
    rm output sample difference 2> /dev/null
    exit 0
fi
