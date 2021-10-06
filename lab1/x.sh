#!/bin/bash

man bash | grep -o '[a-zA-Z]\{4,\}' | tr "[A-Z]" "[a-z]" 
	| sort | uniq -c | sort -r -n | head -3 | awk '{print $2}'
