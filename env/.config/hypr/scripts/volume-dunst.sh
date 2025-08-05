#!/usr/bin/bash

# Get current volume as integer
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d\n", $2 * 100}')

# Optional: Get mute status
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo " (muted)" || echo "")

# Send notification using dunstify with replace-id so it doesn't stack
dunstify -a "Volume" -r 9993 -u low -h int:value:"$volume" "Volume" "${volume}%${muted}"
