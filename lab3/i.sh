#!/bin/bash

TIME=`date +"%Y_%m_%d_%T"`
mkdir /home/user/labab1/lab3/test 2>/dev/null && echo "catalog test was created successfully" &&
	touch /home/user/labab1/lab3/test/$TIME

ping www.net_nikogo.ru 2>/dev/null || printf "%s : Ping is failed/n" "$(date +"%Y_%m_%d_%T")" > ~/report
