#!/bin/bash

SIZE="$1Mb"
PAT_FOLD=$2
PAT_NF1=$3
PAT_NF2=$4

SDA=$(df | grep sda2 | awk '{print $4}')
DATE=$(date +"%d%m%y")
# DATE=$(date +"%d.%m.%y %H:%M:%S")
NAME="$PAT_NF2"_"$DATE"
FIRST_LETTER=""
FIRST_PAT=""

rm log 2> /dev/null

while [ $SDA -gt 1048576 ]
do
    D1=$(ls / | shuf -n1)
    D2=$(sudo ls /$D1 | shuf -n1)
    DIR="/$D1/$D2"
    if [[ -d "$DIR" ]] && ( ! [[ $DIR == "bin"  ]] || [[ $DIR == "sbin" ]] ); then
        DIR1="$DIR/$FIRST_LETTER$PAT_FOLD"
        sudo mkdir "/$DIR1" 2> /dev/null
        echo "$DIR1 $(date +"%H:%M %d.%m.%y") $SIZE" >> log.log
        RAND=$((1 + $RANDOM % 100))
        for (( i = 0; i < $RAND + 1; i++))
        do
            if  [ "$SDA" -gt 1048576 ]; then
                sudo fallocate -l $SIZE /$DIR1/$FIRST_PAT$PAT_NF1.$NAME 2> /dev/null
                echo "$DIR1/$FIRST_PAT$PAT_NF1.$NAME $(date +"%H:%M %d.%m.%y") $SIZE" >> log.log        
                FIRST_PAT=$FIRST_PAT${PAT_NF1:0:1}
                SDA=$(df | grep sda2 | awk '{print $4}')
            else 
                echo "No free space"
                exit
            fi
        done
        FIRST_LETTER=$FIRST_LETTER${PAT_FOLD:0:1}
        FIRST_PAT=""
        SDA=$(df | grep sda2 | awk '{print $4}')
    fi
done 