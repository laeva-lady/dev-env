#!/usr/bin/bash

export GRIMBLAST_EDITOR=gimp

oarsiten() {
    grimblast --notify --freeze edit "$1"
}

case "$1" in
"simple")
    grimblast --notify --freeze copy area
    ;;
"screen")
    oarsiten "screen"
    ;;
*)
    opts="area
active
output
screen"
    selection=$(echo "$opts" | rofi -dmenu -p "Screenshot Options" -theme ~/.config/rofi/aorstie.rasi)

    [ -z "$selection" ] && exit 0

    if [ "$selection" = "screen" ]; then
        oarsiten "screen"
    else
        oarsiten "$selection"
    fi

    ;;
esac
