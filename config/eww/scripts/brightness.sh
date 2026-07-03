#!/bin/bash
print_bri() {
  cur=$(brightnessctl get)
  max=$(brightnessctl max)
  awk -v c="$cur" -v m="$max" 'BEGIN{printf "%d", (c/m)*100}'
}
print_bri
while true; do
  sleep 1
  print_bri
done
