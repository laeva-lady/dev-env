#!/bin/bash

# You can auto-detect location or set a city manually (e.g., "London")
CITY=$(curl -s ipinfo.io | jq -r .city)  # Auto-detect based on IP
# CITY="Berlin"  # Uncomment this to set a fixed city

weather=$(curl -s "wttr.in/${CITY}?format=%t+%f+%c+%C")

if [[ -z "$weather" ]]; then
    echo '{"text": "🌐 error", "tooltip": "Could not fetch weather."}'
    exit 1
fi

echo "{\"text\": \"🌤️ $weather\", \"tooltip\": \"Weather in $CITY\"}"
