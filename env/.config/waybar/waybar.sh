#!/usr/bin/bash

style="kitter"

spawn_regular_bar() {
    waybar &
}

spawn_workspaces() {
    waybar -c "$HOME/.config/waybar/work-only/config.jsonc" -s "$HOME/.config/waybar/work-only/style.css" &
}

case "$1" in
"regular")
    pkill -x waybar
    spawn_regular_bar
    ;;
"work")
    pkill -x waybar
    spawn_workspaces
    ;;
*)
    pkill -x waybar
    spawn_regular_bar
    spawn_workspaces
    ;;
esac
