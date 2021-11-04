#!/bin/bash
echo $$ > .pid_vi
RES=1
MODE="sleeping"
usr1()
{
	MODE="+"
}
usr2()
{
	MODE="*"
}
term()
{
	MODE="TERM"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM
while true; do
	case $MODE in
		"+")
			RES=$(echo "$RES+2" | bc)
			echo $RES
			;;
		"*")
			RES=$(echo "$RES*2" | bc)
			echo $RES
			;;
		"TERM")
			echo "Handler stopped by SIGTERM"
			exit
			;;
	esac
	MODE="sleeping"
	sleep 1
done
