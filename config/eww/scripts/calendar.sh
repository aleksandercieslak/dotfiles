#!/bin/bash
print_cal() {
  monday_offset=$(( $(date +%u) - 1 ))
  jq -nc \
    --arg date "$(date +'%A, %d %B')" \
    --argjson today "$(date +%-d)" \
    --argjson d0 "$(date -d "-${monday_offset} days" +%-d)" \
    --argjson d1 "$(date -d "-$((monday_offset-1)) days" +%-d)" \
    --argjson d2 "$(date -d "-$((monday_offset-2)) days" +%-d)" \
    --argjson d3 "$(date -d "-$((monday_offset-3)) days" +%-d)" \
    --argjson d4 "$(date -d "-$((monday_offset-4)) days" +%-d)" \
    --argjson d5 "$(date -d "-$((monday_offset-5)) days" +%-d)" \
    --argjson d6 "$(date -d "-$((monday_offset-6)) days" +%-d)" \
    '{date:$date,today:$today,week:[
      {label:"M",day:$d0},
      {label:"T",day:$d1},
      {label:"W",day:$d2},
      {label:"T",day:$d3},
      {label:"F",day:$d4},
      {label:"S",day:$d5},
      {label:"S",day:$d6}
    ]}'
}
print_cal
