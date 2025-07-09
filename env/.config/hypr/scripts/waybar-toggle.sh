#!/bin/bash

# Path to a temporary file to store Waybar's hidden state
WAYBAR_HIDDEN_FILE="/tmp/waybar_is_hidden"

# Function to hide Waybar
hide_waybar() {
    if ! pgrep -x waybar > /dev/null; then
        # Waybar is not running, so don't try to hide it
        return
    fi
    if [ ! -f "$WAYBAR_HIDDEN_FILE" ]; then
        pkill waybar
        touch "$WAYBAR_HIDDEN_FILE"
        echo "Waybar hidden."
    fi
}

# Function to show Waybar
show_waybar() {
    if pgrep -x waybar > /dev/null && [ -f "$WAYBAR_HIDDEN_FILE" ]; then
        killall waybar
        rm "$WAYBAR_HIDDEN_FILE"
        echo "Waybar shown."
    fi
}

# Check the number of workspaces with windows
check_workspaces() {
    local active_workspaces=$(hyprctl workspaces -j | jq '.[] | select(.windows > 0)' | jq -s 'length')

    if [ "$active_workspaces" -le 1 ]; then
        hide_waybar
    else
        show_waybar
    fi
}

check_workspaces

# Listen for Hyprland events
socat -u "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" STDOUT | while read -r event; do
    case $event in
        "workspace>>"* | "activewindow>>"*)
            check_workspaces
            ;;
    esac
done
