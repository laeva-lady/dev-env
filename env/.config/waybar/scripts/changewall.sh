#!/usr/bin/bash

set_wallpaper() {
    directory="$HOME/personal/wallpapers"
    files=$(find "$directory" -path "$directory/.git" -prune -o -type f -print | sort)

    file=$(echo "$files" | shuf -n 1)

    swww img "$file" --transition-type=wipe --transition-angle=30
    basefilename=$(basename $file)
    # notify-send "Wallpaper" "Changing to : $basefilename"
    echo "${basefilename%%.*}"
}

set_wallpaper

