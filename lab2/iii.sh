#!bin/bash

ps axo pid,ppid,comm,start --sort=start |
	awk -v VAL="$$" '$1!=VAL && $2!=VAL {print $0}'| tail -n 1 | awk '{print $0}'
