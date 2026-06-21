#!/bin/bash
class=$(hyprctl activewindow -j 2>/dev/null | jq -r '.class // "Desktop"')
echo " $class"
