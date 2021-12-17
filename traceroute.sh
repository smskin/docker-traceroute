#!/usr/bin/env bash
TRACEROUTE_HOST=$(cat /root/TRACEROUTE_HOST)

if [[ -z "${TRACEROUTE_HOST}" ]]; then
  echo "Some default value because TRACEROUTE_HOST is undefined"
  exit
fi

START=$(date +%s)
OUTPUT=$(traceroute -w 10 "${TRACEROUTE_HOST}")
END=$(date +%s)
EXECUTION_TIME=$(( $END - $START ))
printf "{signature:\"traceroute\",target:\"%s\"start:%d,end:%d,execution_time:%d,output:\"%s\"}" "$TRACEROUTE_HOST" "$START" "$END" "$EXECUTION_TIME" "$OUTPUT"
