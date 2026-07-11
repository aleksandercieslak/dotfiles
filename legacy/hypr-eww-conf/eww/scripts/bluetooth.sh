#!/bin/bash
print_bt() {
  enabled=$(bluetoothctl show | grep -q "Powered: yes" && echo true || echo false)
  devices=$(bluetoothctl devices Paired 2>/dev/null | while read -r _ mac name; do
    connected=$(bluetoothctl info "$mac" | grep -q "Connected: yes" && echo true || echo false)
    jq -nc --arg n "$name" --arg m "$mac" --argjson c "$connected" '{name:$n,mac:$m,connected:$c}'
  done | jq -sc '.')
  jq -nc --argjson enabled "$enabled" --argjson devices "${devices:-[]}" \
    '{enabled:$enabled,devices:$devices}'
}
print_bt
