#!/usr/bin/bash


# Take a screenshot of selected region and OCR it
tmpfile=$(mktemp /tmp/ocr_XXXXXX.png)
grim -g "$(slurp)" "$tmpfile"
tesseract "$tmpfile" - -l eng | wl-copy
notify-send "OCR" "Text copied to clipboard"
rm "$tmpfile"
