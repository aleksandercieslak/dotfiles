#!/bin/bash
get_cpu() {
  read -r _ u1 n1 s1 i1 _ < /proc/stat
  sleep 0.3
  read -r _ u2 n2 s2 i2 _ < /proc/stat
  total1=$((u1+n1+s1+i1))
  total2=$((u2+n2+s2+i2))
  idle1=$i1
  idle2=$i2
  diff_total=$((total2-total1))
  diff_idle=$((idle2-idle1))
  if [ "$diff_total" -eq 0 ]; then echo 0; else echo $(( (100*(diff_total-diff_idle))/diff_total )); fi
}
get_ram() {
  free | awk '/Mem:/ {printf "%d", ($2-$7)/$2*100}'
}
get_disk() {
  df -h / | awk 'NR==2 {gsub("%","",$5); print $5}'
}
get_battery() {
  cap=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
  if [ -z "$cap" ]; then echo 100; else echo "$cap"; fi
}
get_gpu() {
  if command -v nvidia-smi &> /dev/null; then
    nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits
  elif [ -f /sys/class/drm/card0/device/gpu_busy_percent ]; then
    cat /sys/class/drm/card0/device/gpu_busy_percent
  else
    echo -1
  fi
}
print_stats() {
  jq -nc \
    --argjson cpu "$(get_cpu)" \
    --argjson ram "$(get_ram)" \
    --argjson disk "$(get_disk)" \
    --argjson bat "$(get_battery)" \
    --argjson gpu "$(get_gpu)" \
    '{cpu:$cpu,ram:$ram,disk:$disk,battery:$bat,gpu:$gpu}'
}
print_stats
