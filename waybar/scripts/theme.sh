#!/bin/bash
THEMES_DIR="$HOME/.config/themes"
CURRENT_FILE="/tmp/current_theme"

THEMES=($(ls "$THEMES_DIR"))
TOTAL=${#THEMES[@]}

CURRENT=$(cat "$CURRENT_FILE" 2>/dev/null || echo "0")
NEXT=$(( (CURRENT + 1) % TOTAL ))

THEME="${THEMES[$NEXT]}"
THEME_DIR="$THEMES_DIR/$THEME"

cp "$THEME_DIR/waybar/style.css" ~/.config/waybar/style.css
cp "$THEME_DIR/rofi/theme.rasi" ~/.config/rofi/theme.rasi
cp "$THEME_DIR/kitty/current-theme.conf" ~/.config/kitty/current-theme.conf
cp "$THEME_DIR/hypr/hyprland.lua" ~/.config/hypr/hyprland.lua
cp "$THEME_DIR/wallpaper.png" ~/.config/wallpaper/wallpaper.png

killall waybar && waybar &
killall hyprpaper && hyprpaper &
kill -SIGUSR1 $(pgrep kitty)

echo "$NEXT" > "$CURRENT_FILE"
