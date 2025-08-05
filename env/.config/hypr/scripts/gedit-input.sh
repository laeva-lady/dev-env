#!/bin/bash

tmpfile=$(mktemp --suffix=.txt)
gedit "$tmpfile" &


# when some other program captures the mouse (e.g. a game) the gedit window isn't focused automatically
window_class="org.gnome.gedit"
attempts=5
while (( attempts > 0 )); do
    win_addr=$(hyprctl clients -j | jq -r ".[] | select(.class==\"$window_class\") | .address")
    if [[ -n "$win_addr" ]]; then
        hyprctl dispatch focuswindow address:$win_addr
        break
    fi
    sleep 0.5
    ((attempts--))
done

while pgrep -f "gedit $tmpfile" >/dev/null; do sleep 0.5; done
if [[ -s "$tmpfile" ]]; then
    cat "$tmpfile" | wl-copy
    notify-send "Copied to Clipboard" "$(cat "$tmpfile")"
else
    notify-send "No Input" "You didn't type anything."
fi

rm "$tmpfile"
