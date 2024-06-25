#!/bin/bash

check='^[1-3]$'

if [ $# != 1 ]
  then
    echo "Invalid number of arguments. Repeat, please"
    exit
fi

if ! [[ $1 =~ $check ]]; then
    echo "Enter a number (1-3)"
    exit 1
fi

if [[ $1 == 1 ]]; then 
    chmod +x first.sh
    sudo ./first.sh
fi

if [[ $1 == 2 ]]; then 
    chmod +x second.sh
    sudo ./second.sh
fi

if [[ $1 == 3 ]]; then 
    chmod +x third.sh
    sudo ./third.sh
fi