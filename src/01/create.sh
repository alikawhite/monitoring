#!/bin/bash

DIR=$1
NUMB_FOLD=$2
PAT_FOLD=$3
NUMB_FILE=$4
PAT_NF1=$5
PAT_NF2=$6
SIZE="$7kb"

SDA=$(df -h | grep sda2 | awk '{print $4}')
SDA_SIZE="${SDA%.*}${SDA#*.}"
SDA_SIZE=${SDA_SIZE%G*}
DATE=$(date +"%d%m%y")
NAME="$PAT_NF2"_"$DATE"
FIRST_LETTER=""
FIRST_PAT=""

function size_check() {
    if [[ "$SDA_SIZE" -le 10 ]]; then
        echo "There is almost no free space"
        exit
    fi
}

rm log 2> /dev/null

for ((i = 0; i < $NUMB_FOLD; i++))
do 
    size_check
    mkdir $DIR$FIRST_LETTER$PAT_FOLD
    echo "$DIR$FIRST_LETTER$PAT_FOLD $(date +"%H:%M %d.%m.%y") $SIZE" >> log
    for ((j = 0; j < $NUMB_FILE; j++))
    do
        size_check
        fallocate -l $SIZE $DIR$FIRST_LETTER$PAT_FOLD/$FIRST_PAT$PAT_NF1.$NAME
        echo "$DIR$FIRST_LETTER$PAT_FOLD/$FIRST_PAT$PAT_NF1.$NAME $(date +"%H:%M %d.%m.%y") $SIZE" >> log        
        FIRST_PAT=$FIRST_PAT${PAT_NF1:0:1}
    done
    FIRST_LETTER=$FIRST_LETTER${PAT_FOLD:0:1}
    FIRST_PAT=""
done

