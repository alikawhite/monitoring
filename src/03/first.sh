#!/bin/bash

LOG="./../02/log.log"
while read y
do
    NAME=$(echo $y | awk '{print $1}')
    rm -rf $NAME 2> /dev/null
done < $LOG