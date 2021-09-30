#!/bin/bash

ANS=""
while true
do
read A
if [[ $A == "q" ]]
then break
fi
ANS+=" "$A
done
echo $ANS
