#!bin/bash

cat /var/log/anaconda/X.log | awk '$3=="(WW)"' | sed -E 's/\(WW\)/Warning:/'>full.log
cat /var/log/anaconda/X.log | awk '$3=="(II)"' | sed -E 's/\(II\)/Information:/'>>full.log

cat full.log
