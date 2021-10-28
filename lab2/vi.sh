#!/bin/bash

cd /proc
for i in $(ls -d -1 [0-9]*)
do
	vmsize=$(grep -i "vmrss" /proc/$i/status 2>/dev/null | awk '{printf $2}')
	if [[ !( -z $vmsize ) ]]
	then
		printf "%s %s\n" "$i" "$vmsize"
	fi
done | sort -nk 2 | tail -1 | awk '{print $1}'
