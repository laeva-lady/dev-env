#!/usr/bin/bash

if pgrep waybar > /dev/null
then
    pkill waybar
else
    waybar &
fi
