#!/bin/bash

check='^[1-4]$'

if [ $# != 1 ]
  then
    echo "Invalid number of arguments. Repeat, please"
    exit
fi

if ! [[ $1 =~ $check ]]; then
    echo "Enter a number (1-4)"
    exit 1
fi

if [[ $1 == 1 ]]; then 
    for ((j = 1; j <= 5; j++))
    do
        LOG="./../04/l$j.log"
        cat $LOG >> log.log
    done
    sort -nk9 log.log
fi

if [[ $1 == 2 ]]; then 
    for ((j = 1; j <= 5; j++))
    do
        LOG="./../04/l$j.log"
        cat $LOG >> log.log
    done
    sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n log.log | uniq -w 12
fi

if [[ $1 == 3 ]]; then 
    for ((j = 1; j <= 5; j++))
    do
        LOG="./../04/l$j.log"
        while read y
        do
            NAME=$(echo $y | awk '{print $9}')
            if [[ $NAME -ge 400 ]] && [[ $NAME -lt 600 ]]; then
                echo $y
            fi
        done < $LOG
    done
fi

if [[ $1 == 4 ]]; then 
    for ((j = 1; j <= 5; j++))
    do
        LOG="./../04/l$j.log"
        cat $LOG >> log.log
    done
    sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n log.log | uniq -w 12 >> meow.log

    while read y
    do
        NAME=$(echo $y | awk '{print $9}')
        if [[ $NAME -ge 400 ]] && [[ $NAME -lt 600 ]]; then
            echo $y
        fi
    done < meow.log
fi

rm log.log meow.log 2> /dev/null