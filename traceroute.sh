#!/usr/bin/env bash
TRACEROUTE_HOST=ya.ru

if [[ -z "${TRACEROUTE_HOST}" ]]; then
  echo "Some default value because TRACEROUTE_HOST is undefined"
  exit
fi

START=$(date +%s)
OUTPUT=$(traceroute -w 10 "${TRACEROUTE_HOST}" |tr "\n" "," )
END=$(date +%s)
EXECUTION_TIME=$(( $END - $START ))
printf "{signature:\"traceroute\",target:\"%s\"start:%d,end:%d,execution_time:%d,output:\"%s\"}" "$TRACEROUTE_HOST" "$START" "$END" "$EXECUTION_TIME" "$OUTPUT"
