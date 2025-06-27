#! /usr/bin/bash
options="youtube.com
reddit.com
twitter.com
comick.io"
selection=$(echo "${options[@]}" | rofi -dmenu -theme ~/.config/rofi/aorstie.rasi)

if [ -n "$selection" ]
then
    zen-browser --new-tab "$selection"
    hyprctl dispatch workspace 1
fi

