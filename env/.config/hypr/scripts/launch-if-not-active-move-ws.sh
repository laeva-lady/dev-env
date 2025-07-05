#!/usr/bin/env bash

output=$(pgrep -x "$1")

if [ -n "$output" ]
then
    hyprctl dispatch workspace "$2"
else
    hyprctl dispatch workspace "$2"
    "$1" &
fi

