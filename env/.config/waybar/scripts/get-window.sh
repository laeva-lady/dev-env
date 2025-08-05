#!/bin/bash

# Get active window info from Hyprland
info=$(hyprctl activewindow -j)

# Use jq to parse title and class
title=$(echo "$info" | jq -r '.title')
class=$(echo "$info" | jq -r '.class')

# Check if title is "Zen"
if [[ "$class" == "zen" ]]; then
    echo "$class"
else
    echo "$title"
fi
