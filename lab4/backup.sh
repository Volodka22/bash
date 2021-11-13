#!/bin/bash

HOME_DIR="/home/user/"

last=1

cd $HOME_DIR

while read line;
do
	it_data=$(echo $line | sed -e "s/^Backup-//")
	cur=$(date +%s -d $it_data)
	if [ $last -lt $cur ]
	then
		last=$cur
	fi
done <<<$(ls -d Backup-* 2> /dev/null)
let DIFF=($(date +%s)-$last)/86400
if [ $DIFF -ge 7 ]
then
	cp -a ./source/. ./Backup-$(date +'%Y-%m-%d')/
else
	last=$(date +'%Y-%m-%d' -d @$last)
	#echo $last
	for file in ./source/*; do
	#	echo $file
		name=$(echo $file | sed -e "s/^.\/source\///")
	#	echo $name
	#	echo ./Backup-$last/$name
		if [[ -f ./Backup-$last/$name ]]; then
			new_c=$(wc -c ./Backup-$last/$name | awk '{print $1}')
			old_c=$(wc -c $file | awk '{print $1}')
	#		echo $new_c
	#		echo $old_c
			if [[ $new_c -ne $old_c ]]
			then
				mv ./Backup-$last/$name ./Backup-$last/$name.$(date +"%Y-%m-%d")
				cp $file ./Backup-$last/$name
			fi
		else
			cp $file ./Backup-$last/$name
		fi
	done
fi
