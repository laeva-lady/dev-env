#!/usr/bin/bash

url="https://www.google.com/search?q="

query=$(rofi -dmenu -matching fuzzy -location 0 -p "Search > " -theme ~/.config/rofi/search.rasi)

if [[ -n "$query" ]]; then
  url=$url$query
  zen-browser --new-tab "$url"
else
  exit
fi

exit 0
