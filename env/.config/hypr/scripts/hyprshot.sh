#!/usr/bin/bash

output_dir="$HOME/Pictures"

case "$1" in
    "simple")
        hyprshot -m "region" -o "$output_dir"
        ;;
    *)
        opts="region
window
output
screen"

        selection=$(echo "$opts" | rofi -dmenu -p "Screenshot Options" -theme ~/.config/rofi/aorstie.rasi)

        [ -z "$selection" ] && exit 0

        if [ "$selection" = "screen" ]
        then
            sleep 0.2
            if grim "$output_dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
            then
                dolphin "$output_dir/"
            fi
        else
            if hyprshot -m "$selection" -o "$output_dir"
            then
                dolphin "$output_dir/"
            fi

        fi
        ;;
esac

