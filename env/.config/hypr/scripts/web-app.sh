#! /usr/bin/bash
options="start.duckduckgo.com
reddit.com
comick.io
twitter.com
youtube.com"
selection=$(echo "${options[@]}" | rofi -dmenu -theme ~/.config/rofi/aorstie.rasi)

if [ -n "$selection" ]
then
    zen-browser --new-tab "$selection"
    hyprctl dispatch workspace 1
fi

