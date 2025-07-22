#!/usr/bin/bash

# Get list of workspaces
workspaces=$(hyprctl workspaces -j | jq -r '.[].name')

# Show the list in rofi and get user choice
selected=$(echo "$workspaces" | rofi -dmenu -p "Switch to workspace:")

# If a workspace was selected, switch to it
if [ -n "$selected" ]; then
    hyprctl dispatch workspace "$selected"
fi
