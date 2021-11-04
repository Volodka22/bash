#!/bin/bash
MOD="+"
RES=1
(tail -f my_pipe) |
while true; do
	read LINE;
	case $LINE in
		"QUIT")
			echo "exit"
			PID=$(ps ax -o pid,ppid,comm | awk -v VAR="$$" '$1 != VAR && $2 == VAR && 
				$3 == "tail" {print $1}')
			kill $PID
			exit
			;;
		"mul")
			MOD="*"
			;;
		"add")
			MOD="+"
			;;
		*)
			if [[ ! "$LINE" =~ ^[0-9]+$ ]]
			then
				echo "Error"
				exit
			fi
			if [ "$MOD" == "+" ]
			then
				RES=$(echo "$RES+$LINE" | bc)
			else
				RES=$(echo "$RES*$LINE" | bc)
			fi
			echo "$RES"
			;;
	esac
done
