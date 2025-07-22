#!/usr/bin/env bash

if pgrep -x "$1" >/dev/null; then
    hyprctl dispatch workspace "$2"
else
    hyprctl dispatch workspace "$2"
    "$1" &

    sleep 0.3
    hyprctl dispatch cyclenext
fi
