#!/usr/bin/bash

state=$(cat ~/.config/hypr/animations-state)

if [ "$state" = "true" ]; then
  echo '{"text": "󰎄", "tooltip": "Animations Enabled", "class": "on"}'
else
  echo '{"text": "󰅗", "tooltip": "Animations Disabled", "class": "off"}'
fi
