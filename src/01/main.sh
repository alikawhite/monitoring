#!/bin/bash

check='^[0-9]+$'

if [ $# != 6 ]
  then
    echo "Invalid number of arguments. Repeat, please"
    exit
fi

if ! ([ -d $1 ] && [[ "$1" =~ '/'$ ]]); then
    echo 'No directory or forgot the "/" at the end!!!'
    exit
else 
    DIR=$1
fi

if ! ([[ $2 =~ $check ]] && [[ $4 =~ $check ]]); then
    echo "Enter a number"
    exit 1
else
    NUMB_FOLD=$2
    NUMB_FILE=$4
fi



source check.sh $3 $5 $6
chmod +x create.sh
sudo ./create.sh $DIR $NUMB_FOLD $PAT_FOLD $NUMB_FILE $PAT_NF1 $PAT_NF2 $SIZE