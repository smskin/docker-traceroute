#!/usr/bin/env bash

TRACEROUTE_HOST=$(cat /root/TRACEROUTE_HOST)
#TRACEROUTE_HOST=ya.ru

if [[ -z "${TRACEROUTE_HOST}" ]]; then
  echo "Some default value because TRACEROUTE_HOST is undefined"
  exit
fi

DT=$(date +%Y-%m-%dT%H:%M:%S%z)
START=$(date +%s)
OUTPUT=$(traceroute -w 10 "${TRACEROUTE_HOST}" |tr "\n" "," )
END=$(date +%s)
EXECUTION_TIME=$(( $END - $START ))
echo "{@t:\"$DT\",@m:\"traceroute\",@l:\"INFO\",@s:\"traceroute\",target:\"$TRACEROUTE_HOST\",start:$START,end:$END,execution_time:$EXECUTION_TIME,output:\"$OUTPUT\"}"