#!/bin/bash

cd /sbin

for file in ./*
do
	file=$(echo $file | sed 's/^.\{2\}//')
	PID= pgrep -fa ^/sbin/${file}$
	if [[ ! -z $PID ]]
	then
		echo $PID
	fi
done
