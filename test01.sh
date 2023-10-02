#!/bin/dash
# test s - substitute command

# check s
seq 1 20 | 2041 slippy 's/[20]/sdsd/' >> sample
seq 1 20 | python3 -s -S slippy 's/[20]/sdsd/' >> output

# have g
seq 1 20 | 2041 slippy 's/[20]/sdsd/g' >> sample
seq 1 20 | python3 -s -S slippy 's/[20]/sdsd/g' >> output

# any non-whitespace character may be used to delimit a substitute command
seq 1 20 | 2041 slippy 's1[20]1sdsd1' >> sample
seq 1 20 | python3 -s -S slippy 's1[20]1sdsd1' >> output

seq 1 20 | 2041 slippy 's1[20]1sdsd1g' >> sample
seq 1 20 | python3 -s -S slippy 's1[20]1sdsd1g' >> output

# -n not work
seq 1 20 | 2041 slippy -n 's/[20]/zzz/' >> sample
seq 1 20 | python3 -s -S slippy -n 's/[20]/zzz/' >> output

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
