#!/bin/bash

# You can auto-detect location or set a city manually (e.g., "London")
CITY="Sainte-Thérèse"
# CITY="Berlin"  # Uncomment this to set a fixed city

weather=$(curl -s "wttr.in/${CITY}?format=%t+%f+%c+%C")

if [[ -z "$weather" ]]; then
    echo '{"text": "🌐 error", "tooltip": "Could not fetch weather."}'
    exit 1
fi

echo "{\"text\": \"🌤️ $weather\", \"tooltip\": \"Weather in $CITY\"}"
