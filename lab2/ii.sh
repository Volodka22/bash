#!/bin/bash

ps a u | awk '$11 ~ "/sbin/.*"{print $2}' > ii.txt
