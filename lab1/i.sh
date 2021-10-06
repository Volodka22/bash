#!/bin/bash

if (( $(echo "$1 <= $2" |bc -l) && $(echo "$2 <= $3" |bc -l) ))
then echo $3
elif (( $(echo "$1 <= $2" |bc -l) && $(echo "$3 <= $2" |bc -l) ))
then echo $2
else echo $1
fi
