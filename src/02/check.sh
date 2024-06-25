#!/bin/bash

check5_1='^([a-z]{1,7})\.'
check3='^([a-z]{1,7})'
check5_2='\.([a-z]{1,3})$'

if [ $# != 3 ]
  then
    echo "Invalid number of arguments. Repeat, please"
    exit
fi

if ! [[ $1 =~ $check3 ]]; then
    echo noooo1>&2
    exit
else 
    PAT_FOLD=$1
fi

if ! [[ $2 =~ $check5_1 ]]; then
    echo nooo3>&2
    exit
else
    PAT_NF1=${2%.*}
fi

if ! [[ $2 =~ $check5_2 ]]; then
    echo nooo2>&2
    exit
else
    PAT_NF2=${2#*.}
fi

if ! ([[ "$3" =~ 'mb'$ ]] || [[ "$3" =~ 'Mb'$ ]] || [[ "$3" =~ 'MB'$ ]]); then 
    echo "The size should be set in kb"
    exit
elif [[ "$3" =~ 'mb'$ ]]; then
    SIZE=${3%m*}
else
    SIZE=${3%M*}
fi

if [[ $SIZE -gt 100 ]]; then
    echo "Error, the size is too big"
    exit
fi