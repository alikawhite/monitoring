#!/bin/bash

check5_1='^([a-z]{1,7})\.'
check3='^([a-z]{1,7})'
check5_2='\.([a-z]{1,3})$'

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

if ! ([[ "$3" =~ 'kb'$ ]] || [[ "$3" =~ 'Kb'$ ]] || [[ "$3" =~ 'KB'$ ]]); then 
    echo "The size should be set in kb"
    exit
elif [[ "$3" =~ 'kb'$ ]]; then
    SIZE=${3%k*}
else
    SIZE=${3%K*}
fi

if [[ "$SIZE" -gt 100 ]]; then
    echo "The size must be less than 100Kb"
    exit
fi
