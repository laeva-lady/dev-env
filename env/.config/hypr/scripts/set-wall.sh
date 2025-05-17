#!/usr/bin/bash

set_wallpaper() {
    directory="$HOME/personal/wallpapers"
    tmpfile=$(mktemp)

    # Generate the list of wallpapers and save mappings to tmpfile
    mapfile -t files < <(find "$directory" -path "$directory/.git" -prune -o -print -type f | sort)

    options=()
    for full_path in "${files[@]}"; do
        filename=$(basename "$full_path")
        options+=("$filename")
        echo "$filename|$full_path" >> "$tmpfile"
    done

    # Use rofi to prompt for selection
    selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Set wallpaper: " -theme ~/.config/rofi/walls.rasi)

    if [ -n "$selected" ]; then
        full_path=$(grep "^$selected|" "$tmpfile" | cut -d'|' -f2-)
        if [ -n "$full_path" ]; then
            swww img "$full_path" --transition-type=wipe --transition-angle=30
        fi
    fi

    rm -f "$tmpfile"
}

set_wallpaper
