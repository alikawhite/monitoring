#!/bin/bash

echo "Настроть поиск в директории, а так же сверку с логом"

check_t='^[0-9]+:[0-9]+$'
check_d='^[1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]$'

read -p "Enter the start time, format:  YEAR-MONTH-DAY HOUR:MINUTE  " DATE_S TIME_S
if ! ([[ $TIME_S =~ $check_t ]] && [[ $DATE_S =~ $check_d ]]); then
    echo "Invalid arg"
    exit
fi

read -p "Enter the end time, format:  YEAR-MONTH-DAY HOUR:MINUTE  " DATE_E TIME_E
if ! ([[ $TIME_E =~ $check_t ]] && [[ $DATE_E =~ $check_d ]]); then
    echo "Invalid arg"
    exit
fi

find / -newermt "$DATE_S $TIME_S" -not -newermt "$DATE_E $TIME_E" -delete 2>/dev/null
