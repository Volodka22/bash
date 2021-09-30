#!bin/bash

grep -h -r -o -E -s -I  '[a-zA-Z0-9_\-\.\+]+@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})' /etc/* |
	awk '{printf $1", "}' > emails.lst
