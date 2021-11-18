#!/bin/bash

HOME_DIR="/home/user/"

cd $HOME_DIR

mkdir ./restore 2>/dev/null

last=1

while read line;
do
	it_data=$(echo $line | sed -e "s/^Backup-//")
	cur=$(date +%s -d $it_data)
	if [ $last -lt $cur ]
	then
		last=$cur
	fi
done <<<$(ls -d Backup-* 2> /dev/null)

if [[ last == "1" ]]
then
	echo "Backup don't found"
	exit
fi

last=$(date +'%Y-%m-%d' -d @$last)

for file in ./Backup-$last/*; do
	name=$(echo $file | sed -e "s/^.\/Backup-$last\///")
	if ! [[ "$file" =~ \.[0-9]{4}[-][0-9]{2}[-][0-9]{2}$ ]]; then
		cp $file ./restore/$name
	fi
done
