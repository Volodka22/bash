#!/bin/bash

ps aux | awk '$11 ~ "^/sbin/.*"{print $0}' > ii.txt
