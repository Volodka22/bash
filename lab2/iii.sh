#!bin/bash

ps a u | awk 'FNR > 1' | sort -k9 | tail -n 1 | awk '{print $2}'
