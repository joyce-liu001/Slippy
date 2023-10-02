#!/bin/dash
# test -f command line option

echo '4q'   >  commands.slippy
echo '$d' >> commands.slippy
seq 1 5 | 2041 slippy -f commands.slippy >> sample
seq 1 5 | python3 -s -S slippy -f commands.slippy >> output

echo '$s?[15]?zzz?'   >  commands.slippy
echo 'p;$q'  >> commands.slippy
seq 1 5 | 2041 slippy -f commands.slippy >> sample
seq 1 5 | python3 -s -S slippy -f commands.slippy >> output

echo '$s?[15]?zzz?'   >  commands.slippy
echo 'p'  >> commands.slippy
seq 1 5 | 2041 slippy -n -f commands.slippy >> sample
seq 1 5 | python3 -s -S slippy -n -f commands.slippy >> output


diff -u sample output >difference
if [ "$?" -eq 1 ]
then
    cat difference
    echo "\033[31mTest Failed\033[0m"
    rm output sample difference 2> /dev/null
    rm -f commands.slippy
    exit 1
else
    echo "\033[32mTest Passed\033[0m"
    rm output sample difference 2> /dev/null
    rm -f commands.slippy
    exit 0
fi