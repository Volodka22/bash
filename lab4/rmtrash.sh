#!/bin/bash

HOME_DIR="/home/user"

mkdir $HOME_DIR/.trash 2> /dev/null

if [[ -z $1 ]] || [[ $1 =~ .*/.* ]]
then
	echo "Incorrect input"
	exit
fi

if [[ ! -f $(pwd)/$1 ]]
then
	echo "$(pwd)/$1 file not found"
	exit
fi

if [ ! -f $HOME_DIR/.trash/.number ]
then
	echo "1" > $HOME_DIR/.trash/.number
fi


NUM=$(cat $HOME_DIR/.trash/.number)

let NUM=$NUM+1

echo $NUM > $HOME_DIR/.trash/.number

ln $(pwd)/$1 $HOME_DIR/.trash/$NUM

rm $(pwd)/$1

echo $1":"$NUM":"$(pwd) >> $HOME_DIR/.trash/.trash.log
