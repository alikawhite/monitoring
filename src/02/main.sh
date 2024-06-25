#!/bin/bash

source check.sh $1 $2 $3
chmod +x create.sh
sudo ./create.sh $SIZE $PAT_FOLD $PAT_NF1 $PAT_NF2