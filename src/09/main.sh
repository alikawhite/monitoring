#!/bin/bash

CPU="$(cat /proc/stat | grep cpu | awk 'NR==1{print $0}')"
MEM="$(free | awk 'NR==2{print $0}')"
DiskUsed="$(df / | awk 'NR==2{print $3}')"
DiskAvailable="$(df / | awk 'NR==2{print $4}')"

for ((i=1; i=1; )); do
    >stat.html
    echo -e "<html>\n<head></head>\n<body>">>stat.html
    echo "<p>$(cat /proc/stat | grep cpu | awk 'NR==1{print $0}')</p>">>stat.html
    echo "<p>$(free | awk 'NR==2{print $0}')</p>">>stat.html
    echo "<p>Disk Used - $(df / | awk 'NR==2{print $3}')</p>">>stat.html
    echo "<p>Disk Available - $(df / | awk 'NR==2{print $4}')</p>">>stat.html
    echo "</body></html>">>stat.html
    sleep 3
done