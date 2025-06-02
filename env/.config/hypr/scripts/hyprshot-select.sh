#!/usr/bin/bash



opts="region
window
output
screen"

selection=$(echo "$opts" | rofi -dmenu -p "Screenshot Options")

if [ "$selection" = "screen" ]
then
	sleep 0.2
	grim $HOME/Downloads/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png
else
	hyprshot -m "$selection" --silent --output-folder "$HOME/Downloads/"
fi

