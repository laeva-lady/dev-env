style="kitter"

if [ -d "$HOME/.config/waybar/$style" ]; then
    WAYBAR_STYLE="$HOME/.config/waybar/$style"
else
    echo "Config Directory does not exists"
    exit 1
fi

waybar -c "$WAYBAR_STYLE/config.jsonc" -s "$WAYBAR_STYLE/style.css"
