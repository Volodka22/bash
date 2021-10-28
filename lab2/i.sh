#!/bin/bash

VAR=$(ps -u user axh -o pid,command)
echo "${VAR}"| wc -l > i.txt
echo "${VAR}">> i.txt
