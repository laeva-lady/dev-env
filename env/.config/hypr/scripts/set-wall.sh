#!/usr/bin/bash



# current_wall=$(swww query | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
# # if swww is not running
# if [ -z current_wall ]
# then
#     $current_wall=$(ps aux | grep mpvpaper | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
# fi

directory="$HOME/personal/wallpapers"
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
selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Wallpaper :" -theme ~/.config/rofi/walls.rasi)

if [ -n "$selected" ]; then
    full_path=$(grep "^$selected|" "$tmpfile" | cut -d'|' -f2-)

    if [ -n "$full_path" ]; then
        extension="${full_path##*.}"
        extension="${extension,,}"  # lowercase


        if [[ "$extension" =~ ^(jpg|jpeg|png|webp|bmp|gif)$ ]]; then
            pkill -x mpvpaper
            swww img "$full_path" --transition-step 100 --transition-fps 144
            notify-send "Wallpaper" "switching to swww with $full_path"
        elif [[ "$extension" =~ ^(mp4|mkv|webm|mov)$ ]]; then
            mpvpaper -p -o "--panscan=1.0 vf-add=fps=10:round=near no-audio --loop-file=inf" ALL "$full_path" &
            notify-send "Wallpaper" "switching to mpvpaper with $full_path"
        else
            notify-send "Unsupported file type: $extension"
        fi
    fi
fi

rm -f "$tmpfile"
