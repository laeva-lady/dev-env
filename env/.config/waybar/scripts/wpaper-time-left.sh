#! /usr/bin/bash

str=$(wpaperctl status)
# returns something like:
#   HDMI-A-1: running (4m left)
#   eDP-1: running (4m left)

first_line=$(echo "$str" | head -n 1)
# gives this part:
#   HDMI-A-1: running (4m left)

if [[ $first_line =~ ([0-9]+[ms]) ]]; then
  echo "${BASH_REMATCH[1]}"
fi
