#!/bin/bash
print_mic() {
  raw=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
  pct=$(echo "$raw" | grep -oP '[0-9]+\.[0-9]+' | awk '{printf "%d", $1*100}')
  echo "$pct"
}
print_mic