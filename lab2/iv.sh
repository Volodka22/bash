#!/bin/bash


cd /proc
for i in $(ls -d -1 [0-9]*)
do
#if test -d "/proc/$i"; then
		PPid=`cat  /proc/$i/status 2>/dev/null | awk '$1=="PPid:"{print $2}'`
		SUM=`cat /proc/$i/sched 2>/dev/null | awk '$1 == "se.sum_exec_runtime"{print $3}'`
		NR=`cat /proc/$i/sched 2>/dev/null | awk '$1 == "nr_switches"{print $3}'`
		if [[ !( -z NR)  ]]
		then
			ART=$(echo "scale=5 ; $SUM / $NR" | bc)
			echo "ProcessID="$i" : Parent_ProcessID="$PPid" : Average_Running_Time="$ART
		fi
#fi
done | sort -n -t '=' -k3 > /home/user/labab1/lab2/iv.txt
