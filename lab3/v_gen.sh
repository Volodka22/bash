#!/bin/bash
while true; do
	read LINE
	if [ "$LINE" == "*" ]
	then
		LINE="mul"
	fi

	if [ "$LINE" == "+" ]
	then
		LINE="add"
	fi

	echo "$LINE" > my_pipe
	if [ "$LINE" == "QUIT" ]
	then
		exit
	fi

	if [ "$LINE" != "add" ] && [ "$LINE" != "mul" ] && [[ ! "$LINE" =~ ^[0-9]+$ ]]
	then
		echo "Error"
		exit
	fi
done
