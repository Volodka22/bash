#!/bin/bash

TRASH_DIR="/home/user/.trash/"

for line in $(cat $TRASH_DIR.trash.log)
do
	name=$(echo $line | awk -F':' '{print $1}')
	num=$(echo $line | awk -F':' '{print $2}')
	path=$(echo $line | awk -F':' '{print $3}')
	if [[ $name == "$1" ]] && [[ -f $TRASH_DIR$num ]]
	then
		echo "untrash "$path"? (y/n)"
		read ans
		if [ "$ans" == "y" ]
		then
			if ! [ -d $path ]; then
				echo $path" is not exist, file wiil untrash into /home/user/"
				path="/home/user"
			fi
			while true; do
				if ! [ -f $path/$name ]; then
					ln $TRASH_DIR$num $path/$name
					rm $TRASH_DIR$num
					break
				fi
				echo $path/$name" is exist, insert new name file"
				read name
			done
		fi
	fi
done
