#!/bin/bash
hide_all() {
  mapfile -t ids < <(hyprctl monitors -j | jq -r '.[].id')
  for m in "${ids[@]}"; do
    eww close "island-$m" 2>/dev/null
  done
}
show_all() {
  ~/.config/eww/scripts/open-island.sh
}
socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - | while read -r line; do
  case "$line" in
    fullscreen\>\>1)
      hide_all
      ;;
    fullscreen\>\>0)
      show_all
      ;;
  esac
done
