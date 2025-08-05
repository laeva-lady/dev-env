#!/usr/bin/bash

output_dir="$HOME/Pictures/screenshots"
mkdir -p "$output_dir"

open_dir_image() {
    thunar "$output_dir/" &

    latest_file=$(eza -snew "$output_dir"/* | tail -n1)
    loupe "$latest_file" &
}

screen() {
    sleep 0.2
    filename="$output_dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
    if grim "$filename"; then
        wl-copy < "$filename"  # 📋 Copy image to clipboard
        open_dir_image
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
        echo "$selection"
        if hyprshot --freeze -m "$selection" -o "$output_dir"; then
            open_dir_image
        fi
    fi
    ;;
esac
