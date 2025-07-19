#!/usr/bin/bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl keyword animations:enabled 0
    notify-send "Gamemode" "Animations disabled"
    exit
fi
hyprctl reload
notify-send "Gamemode" "Animations re-enabled"
