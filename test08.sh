#!/bin/dash
#test -i command line option with more input.txt

seq 1 5 > inputsample1.txt
seq 1 5 > inputoutput1.txt
seq 1 20 > inputsample2.txt
seq 1 20 > inputoutput2.txt
2041 slippy -i -n '/5/s/.//;/.2/p;/[3]/d' inputsample1.txt inputsample2.txt
python3 -s -S slippy -i -n '/5/s/.//;/.2/p;/[3]/d' inputoutput1.txt inputoutput2.txt
cat inputsample1.txt >> sample
cat inputoutput1.txt >> output
cat inputsample2.txt >> sample
cat inputoutput2.txt >> output

seq 1 5 > inputsample1.txt
seq 1 5 > inputoutput1.txt
seq 1 5 > inputsample2.txt
seq 1 5 > inputoutput2.txt
2041 slippy -i '/5/s/5//;/.2/p;6q' inputsample1.txt inputsample2.txt
python3 -s -S slippy -i '/5/s/5//;/.2/p;6q' inputoutput1.txt inputoutput2.txt
cat inputsample1.txt >> sample
cat inputoutput1.txt >> output
cat inputsample2.txt >> sample
cat inputoutput2.txt >> output

diff -u sample output >difference
if [ "$?" -eq 1 ]
then
    #cat difference
    echo "\033[31mTest Failed\033[0m"
    rm output sample difference 2> /dev/null
    #rm -f inputsample1.txt inputoutput1.txt inputsample2.txt inputoutput2.txt
    exit 1
else
    echo "\033[32mTest Passed\033[0m"
    rm output sample difference 2> /dev/null
    rm -f inputsample1.txt inputoutput1.txt inputsample2.txt inputoutput2.txt
    exit 0
fi