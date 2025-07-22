#!/usr/bin/bash

query=$(rofi -dmenu -matching fuzzy -location 0 -p "URL > " -theme ~/.config/rofi/search.rasi)

if [[ -n "$query" ]]; then
  zen-browser --new-tab "$query"
else
  exit
fi

exit 0
