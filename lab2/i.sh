#!/bin/bash

ps a u | awk 'FNR>1 && $1=="user"{print $2":"$11}'| wc -l > i.txt
ps a u | awk 'FNR>1 && $1=="user"{print $2":"$11}'>> i.txt
