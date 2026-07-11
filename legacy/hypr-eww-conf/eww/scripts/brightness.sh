#!/bin/bash
print_bri() {
  if ! command -v brightnessctl &> /dev/null; then
    echo 100
    return
  fi
  device=$(brightnessctl -l 2>/dev/null | grep "class 'backlight'" | head -1 | sed -n "s/Device '\(.*\)' of.*/\1/p")
  if [ -z "$device" ]; then
    echo 100
    return
  fi
  cur=$(brightnessctl -d "$device" get 2>/dev/null)
  max=$(brightnessctl -d "$device" max 2>/dev/null)
  if [ -z "$cur" ] || [ -z "$max" ] || [ "$max" = "0" ]; then
    echo 100
    return
  fi
  awk -v c="$cur" -v m="$max" 'BEGIN{printf "%d", (c/m)*100}'
}
print_bri