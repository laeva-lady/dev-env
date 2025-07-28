#!/usr/bin/bash

style="kitter"

spawn_regular_bar() {
    if [ -d "$HOME/.config/waybar/$style" ]; then
        WAYBAR_STYLE="$HOME/.config/waybar/$style"
    else
        echo "Config Directory does not exist"
        exit 1
    fi

    waybar -c "$WAYBAR_STYLE/config.jsonc" -s "$WAYBAR_STYLE/style.css" &
}

spawn_workspaces() {
    waybar -c "$HOME/.config/waybar/work-only/config.jsonc" -s "$HOME/.config/waybar/work-only/style.css" &
}

case "$1" in
"regular")
    REGULAR_CONFIG="$HOME/.config/waybar/$style/config.jsonc"
    pid=$(pgrep -a waybar | grep "$REGULAR_CONFIG" | awk '{print $1}')
    if [ -n "$pid" ]; then
        echo "Killing regular bar (PID $pid)"
        kill "$pid"
    else
        echo "Spawning regular bar"
        spawn_regular_bar
    fi
    ;;
"work")
    WORK_CONF="$HOME/.config/waybar/work-only/config.jsonc"
    pid=$(pgrep -a waybar | grep "$WORK_CONF" | awk '{print $1}')
    if [ -n "$pid" ]; then
        echo "Killing work bar (PID $pid)"
        kill "$pid"
    else
        echo "Spawning work bar"
        spawn_workspaces
    fi
    ;;
*)
    pkill waybar
    spawn_regular_bar
    spawn_workspaces
    ;;
esac
