#!/bin/bash
print_vol() {
  raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  pct=$(echo "$raw" | grep -oP '[0-9]+\.[0-9]+' | awk '{printf "%d", $1*100}')
  echo "$pct"
}
print_vol