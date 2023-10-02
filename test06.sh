#!/bin/dash
#test -i command line option 

seq 1 5 > inputsample.txt
seq 1 5 > inputoutput.txt
2041 slippy -i '4q;$d' inputsample.txt
python3 -s -S slippy -i '4q;$d' inputoutput.txt
cat inputsample.txt >> sample
cat inputoutput.txt >> output

seq 1 20 > inputsample.txt
seq 1 20 > inputoutput.txt
2041 slippy -i '1p;/5/s/.//;/.2/p;20q' inputsample.txt
python3 -s -S slippy -i '1p;/5/s/.//;/.2/p;20q' inputoutput.txt
cat inputsample.txt >> sample
cat inputoutput.txt >> output

diff -u sample output >difference
if [ "$?" -eq 1 ]
then
    cat difference
    echo "\033[31mTest Failed\033[0m"
    rm output sample difference 2> /dev/null
    rm -f inputsample.txt inputoutput.txt
    exit 1
else
    echo "\033[32mTest Passed\033[0m"
    rm output sample difference 2> /dev/null
    rm -f inputsample.txt inputoutput.txt
    exit 0
fi