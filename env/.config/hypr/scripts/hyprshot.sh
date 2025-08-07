#!/usr/bin/bash

output_dir="$HOME/Pictures/"

screen() {
    sleep 0.2
    filename="$output_dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
    if grim "$filename"; then
        wl-copy <"$filename"
    fi
}

case "$1" in
"simple")
    hyprshot -z -m "region" --clipboard-only
    ;;
"screen")
    screen
    ;;
*)
    opts="region
window
output
screen"

    selection=$(echo "$opts" | rofi -dmenu -p "Screenshot Options" -theme ~/.config/rofi/aorstie.rasi)

    [ -z "$selection" ] && exit 0

    if [ "$selection" = "screen" ]; then
        screen
    else
        hyprshot -m "$selection" -o "$output_dir"
    fi
    ;;
esac
