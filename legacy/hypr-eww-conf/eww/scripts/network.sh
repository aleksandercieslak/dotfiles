#!/bin/bash
print_net() {
  enabled=$(nmcli -t -f WIFI g | grep -q enabled && echo true || echo false)
  current=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep '^yes' | cut -d: -f2)
  networks=$(nmcli -t -f ssid,signal,security dev wifi list 2>/dev/null | awk -F: '!seen[$1]++ && $1!=""' | head -8 | while IFS=: read -r ssid signal security; do
    secured="false"
    [ -n "$security" ] && [ "$security" != "--" ] && secured="true"
    jq -nc --arg s "$ssid" --argjson sig "${signal:-0}" --argjson sec "$secured" '{ssid:$s,signal:$sig,secured:$sec}'
  done | jq -sc '.')
  jq -nc --argjson enabled "$enabled" --arg current "$current" --argjson networks "${networks:-[]}" \
    '{enabled:$enabled,current:$current,networks:$networks}'
}
print_net
