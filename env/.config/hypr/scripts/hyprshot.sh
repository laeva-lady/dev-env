#!/usr/bin/bash

output_dir="$HOME/Pictures/screenshots"
mkdir -p "$output_dir"

open_dir_image() {
    thunar "$output_dir/" &

    latest_file=$(ls -t "$output_dir"/*.png | head -n1)
    loupe "$latest_file" &
}

case "$1" in
"simple")
    hyprshot -z -m "region" --clipboard-only
    ;;
*)
    opts="region
window
output
screen"

    selection=$(echo "$opts" | rofi -dmenu -p "Screenshot Options" -theme ~/.config/rofi/aorstie.rasi)

    [ -z "$selection" ] && exit 0

    if [ "$selection" = "screen" ]; then
        sleep 0.2
        if grim "$output_dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"; then
            open_dir_image
        fi
    else
        if hyprshot --freeze -m "$selection" -o "$output_dir"; then
            open_dir_image
        fi

    fi
    ;;
esac
