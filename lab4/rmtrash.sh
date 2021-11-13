#!/bin/bash

HOME_DIR="/home/user"

mkdir $HOME_DIR/.trash 2> /dev/null

if [ ! -f $HOME_DIR/.trash/.number ]
then
	echo "1" > $HOME_DIR/.trash/.number
fi

cat $HOME_DIR/.trash/.number

NUM=$(cat $HOME_DIR/.trash/.number)

let NUM=$NUM+1

echo $NUM > $HOME_DIR/.trash/.number

ln $(pwd)/$1 $HOME_DIR/.trash/$NUM

rm $(pwd)/$1

echo $1":"$NUM":"$(pwd) >> $HOME_DIR/.trash/.trash.log
