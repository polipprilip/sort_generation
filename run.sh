#!/bin/bash
rm -r results
mkdir results

g++ -std=c++11 main.cpp -o sorting

for i in 100 1000 10000 20000
do
    sleep 1
    fname=`date +%s%3N`

    echo "$i " >> "results/$fname.txt"
    for j in `seq 1 10`
    do
        #sleep 1
        ./sorting $i random $i 100 >> "results/$fname.txt"
        if [ $? -ne 0 ]
        then
            echo FAIL - see "results/$fname.txt"
            exit 0
        fi
    done
done

python graphic.py results

