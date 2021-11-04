#!/bin/bash
while true; do
	read LINE
	case $LINE in
		"+")
			kill -USR1 $(cat .pid_vi)
			;;
		"*")
			kill -USR2 $(cat .pid_vi)
			;;
		"TERM")
			kill -SIGTERM $(cat .pid_vi)
			exit
			;;
	esac
done
