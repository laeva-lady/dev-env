#!/usr/bin/bash

set_wallpaper() {
    directory="$HOME/personal/dev-env/env/wallpapers"

    # Create a temporary file to hold mappings
    tmpfile=$(mktemp)

    # Populate the list and mapping file
    find "$directory" -type f | while read -r full_path; do
        filename=$(basename "$full_path")
        echo "$filename"    # print to rofi
        echo "$filename|$full_path" >> "$tmpfile"  # store mapping
    done | rofi -dmenu -p "Set wallpaper: " -theme ~/.config/rofi/walls.rasi | while read -r selected; do
        if [ -n "$selected" ]; then
            # Look up full path from mapping file
            full_path=$(grep "^$selected|" "$tmpfile" | cut -d'|' -f2-)
            if [ -n "$full_path" ]; then
                swww img "$full_path" --transition-type=wipe --transition-angle=30
            fi
        fi
    done

    rm -f "$tmpfile"
}

set_wallpaper
