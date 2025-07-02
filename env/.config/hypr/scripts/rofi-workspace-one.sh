#!/usr/bin/env bash

current_ws=$(hyprctl activeworkspace | grep -E "workspace ID [0-9]+" | awk '{print $3}')
windows=$(hyprctl activeworkspace | grep -E "windows: [0-9]+" | awk '{print $2}')

if [ "$windows" != "0" ]
then
    echo "More than 1 window"
    hyprctl dispatch workspace "$((current_ws + 1))"
else
    echo "0 windows"
fi

rofi -show drun -theme ~/.config/rofi/aorstie.rasi

# hyprctl dispatch exec "[workspace 5] kitty"
