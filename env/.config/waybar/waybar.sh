if [ -z "$WAYBAR_STYLE" ]; then
    WAYBAR_STYLE="$HOME/.config/waybar/default"
fi

if [ -n "$1" ]; then
    if [ -d "$HOME/.config/waybar/$1" ]; then
        WAYBAR_STYLE="$HOME/.config/waybar/$1"
    else
        echo "Config Directory does not exists"
        exit 1
    fi
fi

waybar -c "$WAYBAR_STYLE/config.jsonc" -s "$WAYBAR_STYLE/style.css"
