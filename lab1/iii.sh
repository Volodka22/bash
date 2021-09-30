#!/bin/bash

PS3='Please enter your choice: '
select opt in nano vi links quit
do
	case $opt in 
		"nano")
			nano
			;;
		"vi")
			vi
			;;
		"links")
			links
			;;
		"quit")
			break
			;;
		*) echo "invalid option $REPLY" ;;
	esac
done
