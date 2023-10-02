#!/bin/dash
#test  a/i/c command

# check a
seq 1 10 | 2041 slippy '1,3a hello' >> sample
seq 1 10 | python3 -s -S slippy '1,3a hello' >> output

seq 1 10 | 2041 slippy '/1/,/3/a hello' >> sample
seq 1 10 | python3 -s -S slippy '/1/,/3/a hello' >> output

seq 1 10 | 2041 slippy '1, /2/a hello' >> sample
seq 1 10 | python3 -s -S slippy '1, /2/a hello' >> output

# check i
seq 1 10 | 2041 slippy '1,3i hello' >> sample
seq 1 10 | python3 -s -S slippy '1,3i hello' >> output

seq 1 10 | 2041 slippy '/1/,/3/i hello' >> sample
seq 1 10 | python3 -s -S slippy '/1/,/3/i hello' >> output

seq 1 10 | 2041 slippy '/2/, 3i hello' >> sample
seq 1 10 | python3 -s -S slippy '/2/, 3i hello' >> output

# check c
seq 1 10 | 2041 slippy '/3/c hello' >> sample
seq 1 10 | python3 -s -S slippy '/3/c hello' >> output

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
