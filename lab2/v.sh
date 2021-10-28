#!/bin/bash

k=$(cat iv.txt | wc -l)
i=0
c=0
b=0
m=0
last=-1
cat iv.txt | while read line;
do
	ppid=`echo $line | awk '{print $3}' | sed -e 's/Parent_ProcessID=//'`
	art=`echo $line | awk '{print $5}' | sed -e 's/Average_Running_Time=//'`

	if [[ c -eq 0 ]]
	then
		last=$ppid
	fi

	if [[ $last -ne $ppid ]]
	then
		b=$(echo "scale=5; $m/$i" | bc)
		i=0
		m=0
		printf "Average_Running_Children_of_ParentID=%s is %s\n" "$last" "$b"
		last=$ppid
	fi
	i=$((i+1))
	c=$((c+1))
	m=$(echo "scale=5; $m+$art" | bc)
	echo $line
	if [[ c -eq k ]]
	then
		b=$(echo "scale=5; $m/$i" | bc)
		printf "Average_Running_Children_of_ParentID=%s is %s\n" "$last" "$b"
	fi
done > v.txt
