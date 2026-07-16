#!/bin/bash
mapfile -t monitors < <(hyprctl monitors -j | jq -r '.[].id')
for m in "${monitors[@]}"; do
  eww open island --screen "$m" --id "island-$m"
done
