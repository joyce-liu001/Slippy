#!/bin/dash
# test Comments & White Space

seq 1 20 | 2041 slippy ' 2, 10  d  # delete ' >> sample
seq 1 20 | python3 -s -S slippy ' 2, 10  d  # delete ' >> output

seq 1 30 | 2041 slippy -n '1p ; /5/s/.// ; /.2/p#hello;30q#hello' >> sample
seq 1 30 | python3 -s -S slippy -n '1p ; /5/s/.// ; /.2/p#hello;30q#hello' >> output

seq 1 20 | 2041 slippy '/4$/,/9$/d #d ; 5,7p #p' >> sample
seq 1 20 | python3 -s -S slippy '/4$/,/9$/d #d ; 5,7p #p' >> output

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
