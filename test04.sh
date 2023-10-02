#!/bin/dash
# test Addresses

# no output
seq 1 5 | 2041 slippy -n '$d' >> sample
seq 1 20 | python3 -s -S slippy -n '$d' >> output

seq 1 5 | 2041 slippy '$s?[15]?zzz?' >> sample
seq 1 5 | python3 -s -S slippy '$s?[15]?zzz?' >> output

seq 1 5 | 2041 slippy '2,$s?[15]?zzz?' >> sample
seq 1 5 | python3 -s -S slippy '2,$s?[15]?zzz?' >> output

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