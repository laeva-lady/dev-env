#!/usr/bin/bash



opts="region
window
output"

hyprshot -m $(echo "$opts" | rofi -dmenu)
