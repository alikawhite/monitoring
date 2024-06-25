#!/bin/bash

cat ./../04/l5.log ./../04/l1.log ./../04/l2.log ./../04/l3.log ./../04/l4.log >> goaccess.log
goaccess -f ./goaccess.log -p ./goaccess.conf -o ./go-access.html
rm *.log