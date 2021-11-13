#!/bin/bash

HOME_DIR="/home/user/"

last="0"

cd $HOME_DIR

ls -d Backup-* 2> /dev/null | while read line;
do
	echo $line
	it_data=${$line%"Backup-"}
	cur=$(date +%s -d $it_data)
	echo cur
	if [ $last -lt $cur ]
	then
		last=$cur
	fi
done
let DIFF=($(date +%s)-$last)/86400
if [ $DIFF -ge 7 ]
then
	cp -r ./source ./Backup-$(date +'%Y-%m-%d')
else
	last=$(date +'%Y-%m-%d' -d $last)
	flag="false"
	for file in ./source/*; do
		if [[ -f ./Backup-$last/$file ]]; then
			flag="true"
			if [[ $(wc -c ./Backup-$last/$file) -eq $(wc ) ]]
		else
			cp ./source/file ./Backup-$last/$file
		fi
	done
fi
