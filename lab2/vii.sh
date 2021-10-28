#!/bin/bash

cd /proc
tmp=$( for pid in $(ls -d -1 [0-9]*)
do
	bytes=$(grep "read_bytes" /proc/$pid/io 2>/dev/null | awk '{printf $2}')
	if [[ !( -z $bytes ) ]]
	then
		printf "%s %s\n" "$pid" "$bytes"
	fi
done )
sleep 10
tmp2=$( echo "$tmp" | while read line;
do
	pid=$(echo $line | awk '{printf $1}')
	b=$(echo $line | awk '{printf $2}')
	bytes=$(grep "read_bytes" /proc/$pid/io 2>/dev/null | awk '{printf $2}')
	if [[ !( -z $bytes ) ]]
	then
		ans=$((bytes-b))
	fi
	cmd=$(cat /proc/$pid/cmdline 2>/dev/null | tr '\0' ']')
	if [[ !( -z $cmd ) ]]
	then
		printf "%s %s %s\n" "$pid" "$cmd" "$ans"
	fi
done | sort -nk3 | tail -n -3 )

echo "$tmp2" | while read line;
do
	pid=$(echo $line | awk '{printf $1}')
	cmd=$(echo $line |  awk '{printf $2}' | tr ']' ' ')
	bytes=$(echo $line | awk '{printf $3}')
	printf "%s:%s:%s\n" "$pid" "$cmd" "$bytes"
done > /home/user/labab1/lab2/vii.txt

