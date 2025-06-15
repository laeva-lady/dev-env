#!/usr/bin/bash


lang_choices="eng
jpn"

lang_selected=$(echo "$lang_choices" | rofi -dmenu -p "Language" -i -theme ~/.config/rofi/config.rasi)

# Take a screenshot of selected region and OCR it
tmpfile=$(mktemp /tmp/ocr_XXXXXX.png)
grim -g "$(slurp)" "$tmpfile"
if tesseract "$tmpfile" - -l "$lang_selected" | wl-copy; then
  notify-send "OCR" "Text copied to clipboard"
else
  notify-send "OCR Error" "Failed to process or copy text"
fi
rm "$tmpfile"

# 神の
