#! /usr/bin/bash
options="start.duckduckgo.com
reddit.com
comick.io
twitter.com
youtube.com
chatgpt.com"
selection=$(echo "${options[@]}" | rofi -dmenu -theme ~/.config/rofi/aorstie.rasi)

if [ -n "$selection" ]
then
    firefox --new-window "$selection" &
fi

