#!/usr/bin/bash

directory="$HOME/personal/wallpapers"

wall=$(swww query | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
if [ -z $current_wall ]
then
    current_wall=$(ps aux | grep mpvpaper | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
fi

tmpfile=$(mktemp)
choice_tmp=$(mktemp)
tmp_options=$(mktemp)

# Gather files, ignoring .git
mapfile -t files < <(find "$directory" -path "$directory/.git" -prune -o -type f -print | sort)

options=()
for full_path in "${files[@]}"; do
    filename=$(basename "$full_path")
    echo "$filename" >> "$tmp_options"
    echo "$filename|$full_path" >> "$tmpfile"
done

kitty --class="kitty_walls" bash -c '
    cat "'"$tmp_options"'" \
    | fzf \
        --preview="grep {} '$tmpfile' \
            | cut -d \"|\" -f2 \
            | xargs chafa --size=80x" \
        --preview-window=right:70%:wrap \
    > "'"$choice_tmp"'"
'

selected=$(cat "$choice_tmp")

if [ -n "$selected" ]; then
    full_path=$(grep "^$selected|" "$tmpfile" | cut -d'|' -f2-)

    if [ -n "$full_path" ]; then
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
    fi
fi

rm -f "$tmpfile"
rm -f "$choice_tmp"
rm -f "$tmp_options"
