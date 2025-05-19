#!/usr/bin/bash


content=$(swww query | head -n 1 | grep -oE "[A-Za-z0-9\-_]+.jpg")
echo "$content"

