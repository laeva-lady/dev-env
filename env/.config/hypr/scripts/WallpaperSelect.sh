#!/usr/bin/bash
# ---- taken and adapted from : https://github.com/JaKooLit/Hyprland-Dots

# WALLPAPERS PATH
wallDIR="$HOME/personal/wallpapers"

# swww transition config
FPS=144
TYPE="fade"
DURATION=1
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

rofi_theme="$HOME/.config/rofi/config-wallpaper.rasi"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

scale_factor=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .scale')
monitor_height=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .height')

icon_size=$(echo "scale=1; ($monitor_height * 5) / ($scale_factor * 200)" | bc)
adjusted_icon_size=$(echo "$icon_size" | awk '{if ($1 < 15) $1 = 20; if ($1 > 25) $1 = 25; print $1}')
rofi_override="element-icon{size:${adjusted_icon_size}%;}"

kill_wallpaper() {
    pkill mpvpaper 2>/dev/null
    pkill swaybg 2>/dev/null
    pkill hyprpaper 2>/dev/null
}

# Retrieve wallpapers (both images & videos)
mapfile -d '' PICS < <(find -L "${wallDIR}" -type f \( \
    -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o \
    -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" -o \
    -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.webm" \) -print0)

# Rofi command
rofi_command="rofi -i -show -dmenu -config $rofi_theme -theme-str $rofi_override"

# Sorting Wallpapers
menu() {
    IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))

    # printf "%s\x00icon\x1f%s\n" "$RANDOM_PIC_NAME" "$RANDOM_PIC"

    for pic_path in "${sorted_options[@]}"; do
        pic_name=$(basename "$pic_path")
        if [[ "$pic_name" =~ \.gif$ ]]; then
            cache_gif_image="$HOME/.cache/gif_preview/${pic_name}.png"
            if [[ ! -f "$cache_gif_image" ]]; then
                mkdir -p "$HOME/.cache/gif_preview"
                magick "$pic_path[0]" -resize 1920x1080 "$cache_gif_image"
            fi
            printf "%s\x00icon\x1f%s\n" "$pic_name" "$cache_gif_image"
        elif [[ "$pic_name" =~ \.(mp4|mkv|mov|webm|MP4|MKV|MOV|WEBM)$ ]]; then
            cache_preview_image="$HOME/.cache/video_preview/${pic_name}.png"
            if [[ ! -f "$cache_preview_image" ]]; then
                mkdir -p "$HOME/.cache/video_preview"
                ffmpeg -v error -y -i "$pic_path" -ss 00:00:01.000 -vframes 1 "$cache_preview_image"
            fi
            printf "%s\x00icon\x1f%s\n" "$pic_name" "$cache_preview_image"
        else
            printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
        fi
    done
}

# Apply Image Wallpaper
apply_image_wallpaper() {
    local image_path="$1"

    kill_wallpaper

    if ! pgrep -x "swww-daemon" >/dev/null; then
        echo "Starting swww-daemon..."
        swww-daemon --format xrgb &
    fi

    swww img "$image_path" $SWWW_PARAMS
}

apply_video_wallpaper() {
    local video_path="$1"
    kill_wallpaper
    mpvpaper '*' -o "--panscan=1.0 vf-add=fps=10:round=near no-audio --loop-file=inf" "$video_path" &
}

# Main function
main() {
    choice=$(menu | $rofi_command)
    choice=$(echo "$choice" | xargs)


    if [[ -z "$choice" ]]; then
        exit 0
    fi

    choice_basename=$(basename "$choice" | sed 's/\(.*\)\.[^.]*$/\1/')

    # Search for the selected file in the wallpapers directory, including subdirectories
    selected_file=$(find "$wallDIR" -iname "$choice_basename.*" -print -quit)


    # Symlink the file so Hyprlock can read the current wallpaper at ~/.current.wall
    rm $HOME/.current.wall
    ln -s "$selected_file" $HOME/.current.wall

    # copies in root to allow sddm to use the current wallpaper
    sudo mkdir -p /usr/share/wallpapers/Customs/
    sudo cp "$selected_file" /usr/share/wallpapers/Customs/current.wall


    if [[ -z "$selected_file" ]]; then
        exit 1
    fi

    if [[ "$selected_file" =~ \.(mp4|mkv|mov|webm|MP4|MKV|MOV|WEBM)$ ]]; then
        apply_video_wallpaper "$selected_file"
    else
        apply_image_wallpaper "$selected_file"
    fi
}

main
