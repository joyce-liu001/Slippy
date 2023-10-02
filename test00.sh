#!/bin/dash
# subset0
# test q, p and d and -n

# check p
seq 1 20 | 2041 slippy '/.5/p' >> sample
seq 1 20 | python3 -s -S slippy '/.5/p' >> output

seq 1 20 | 2041 slippy -n '/.5/p' >> sample
seq 1 20 | python3 -s -S slippy -n '/.5/p' >> output

seq 1 20 | 2041 slippy '/.{2}/p' >> sample
seq 1 20 | python3 -s -S slippy '/.{2}/p' >> output

seq 1 20 | 2041 slippy -n '/.{2}/p' >> sample
seq 1 20 | python3 -s -S slippy -n '/.{2}/p' >> output

# check q
seq 1 20 | 2041 slippy '/.9/q' >> sample
seq 1 20 | python3 -s -S slippy '/.9/q' >> output

seq 1 20 | 2041 slippy '/.[234]/q' >> sample
seq 1 20 | python3 -s -S slippy '/.[234]/q' >> output
# -n not work
seq 1 20 | 2041 slippy -n '/^10/q' >> sample
seq 1 20 | python3 -s -S slippy -n '/^10/q' >> output

seq 1 20 | 2041 slippy -n '/.9/q' >> sample
seq 1 20 | python3 -s -S slippy -n '/.9/q' >> output

# check d
seq 1 20 | 2041 slippy '/.9/d' >> sample
seq 1 20 | python3 -s -S slippy '/.9/d' >> output

seq 1 20 | 2041 slippy '/.[234]/d' >> sample
seq 1 20 | python3 -s -S slippy '/.[234]/d' >> output
# -n not work
seq 1 20 | 2041 slippy -n '/^10/d' >> sample
seq 1 20 | python3 -s -S slippy -n '/^10/d' >> output

seq 1 20 | 2041 slippy -n '/.9/d' >> sample
seq 1 20 | python3 -s -S slippy -n '/.9/d' >> output

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

