#!/usr/bin/bash


# .*\/ – match everything up to the last /
# \([^/.]*\) – capture everything that is not a / or . (i.e., file)
# \. – match the first . after that
# .* – ignore the rest
# |\1| – replace with only the captured group (no dot)
# -n + p – suppress automatic printing and print only matches

content=$(swww query | head -n 1 | sed -n 's|.*/\([^/.]*\)\..*|\1|p')
echo "$content"

