#!/usr/bin/bash


lang_choices="eng
jpn
chi_sim"

lang_selected=$(echo "$lang_choices" | rofi -dmenu -p "Language" -i -theme ~/.config/rofi/aorstie.rasi)

# Take a screenshot of selected region and OCR it
tmpfile=$(mktemp /tmp/ocr_XXXXXX.png)
grim -g "$(slurp)" "$tmpfile"
text=$(tesseract "$tmpfile" - -l "$lang_selected")
if [ -n "$text" ]
then
    notify-send "OCR" "[$text] copied to clipboard"
    echo "$text" | wl-copy
else
    notify-send "OCR Error" "Failed to process or copy text"
fi
rm "$tmpfile"
