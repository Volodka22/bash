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

REPORT=""

if [ $DIFF -ge 7 ]
then
	cp -a ./source/. ./Backup-$(date +'%Y-%m-%d')/
	REPORT="Create new backup $HOME_DIRBackup-$last $(date +'%Y-%m-%d')\n add files:"
	for file in ./source/*; do
		REPORT="$REPORT $file"
	done
	echo "$REPORT" >> ./backup-report
else
	last=$(date +'%Y-%m-%d' -d @$last)
	UPDATE="update files: "
	REPORT="Update $HOME_DIR/Backup-$last $(date +'%Y-%m-%d')\n add files:"
	for file in ./source/*; do
		name=$(echo $file | sed -e "s/^.\/source\///")
		if [[ -f ./Backup-$last/$name ]]; then
			new_c=$(wc -c ./Backup-$last/$name | awk '{print $1}')
			old_c=$(wc -c $file | awk '{print $1}')
			if [[ $new_c -ne $old_c ]]
			then
				mv ./Backup-$last/$name ./Backup-$last/$name.$(date +"%Y-%m-%d")
				cp $file ./Backup-$last/$name
				UPDATE="$UPDATE ./Backup-$(last)/$(name) ./Backup-$(last)/$(name).$(date +'%Y-%m-%d')"
			fi
		else
			cp $file ./Backup-$last/$name
			REPORT="$REPORT $file"
		fi
	done
	echo "$REPORT\n $UPDATE" >> ./backup-report
fi
