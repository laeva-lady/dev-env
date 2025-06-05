#!/usr/bin/bash


directory="$HOME/personal/wallpapers"

set_wall() {
    full_path="$1"
    pkill mpvpaper
    # pkill swww

    extension="${full_path##*.}"
    case "$extension" in
        jpg|jpeg|png|bmp|webp)
            # Use swww
            swww-daemon & disown
            sleep 2
            swww img "$full_path"
            notify-send "Wallpaper" "Switching to $full_path"
            ;;
        mp4|webm|mkv|mov)
            mpvpaper -p -o "--panscan=1.0 vf-add=fps=10:round=near no-audio --loop-file=inf" ALL "$full_path" &
            notify-send "Wallpaper" "Switching to $full_path"
            ;;
        *)
            notify-send "Unsupported file type: $extension"
            ;;
    esac
}

randomized() {
    wall=$(find  "$directory" -type f | shuf -n 1)

    set_wall "$wall"
}

selected() {
    wall=$(swww query | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
    if [ -z $current_wall ]
    then
        current_wall=$(ps aux | grep mpvpaper | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
    fi

    tmpfile=$(mktemp)

    # Gather files, ignoring .git
    mapfile -t files < <(find "$directory" -path "$directory/.git" -prune -o -type f -print | sort)

    options=()
    for full_path in "${files[@]}"; do
        filename=$(basename "$full_path")
        options+=("$filename")
        echo "$filename|$full_path" >> "$tmpfile"
    done

    # Prompt user to select
    selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Current : $current_wall" -matching glob -theme ~/.config/rofi/walls.rasi)

    if [ -n "$selected" ]; then
        full_path=$(grep "^$selected|" "$tmpfile" | cut -d'|' -f2-)

        if [ -n "$full_path" ]; then
            set_wall "$full_path"
        fi
    fi

    rm -f "$tmpfile"
}

case $1 in
    random)
        randomized
        ;;
    select)
        selected
        ;;
    *)
        echo "No valid option selected"
        ;;
esac
