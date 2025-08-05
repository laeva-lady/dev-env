#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_mode"
REGULAR_CONFIG="$HOME/.config/waybar/config.jsonc"
WORK_CONFIG="$HOME/.config/waybar/work-only/config.jsonc"
WORK_STYLE="$HOME/.config/waybar/work-only/style.css"

spawn_regular_bar() {
    waybar &
}

spawn_workspaces() {
    waybar -c "$WORK_CONFIG" -s "$WORK_STYLE" &
}

switch_to() {
    pkill -x waybar
    while pgrep -x waybar >/dev/null; do sleep 0.1; done

    case "$1" in
    regular)
        spawn_regular_bar
        echo "regular" >"$STATE_FILE"
        ;;
    work)
        spawn_workspaces
        echo "work" >"$STATE_FILE"
        ;;
    esac
}

case "$1" in
"regular" | "work")
    switch_to "$1"
    ;;
"toggle")
    if [[ -f "$STATE_FILE" ]]; then
        current=$(cat "$STATE_FILE")
    else
        current="regular"
    fi

    if [[ "$current" == "regular" ]]; then
        switch_to work
    else
        switch_to regular
    fi
    ;;
*)
    echo "usage: $0 {regular|work|toggle}"
    ;;
esac
