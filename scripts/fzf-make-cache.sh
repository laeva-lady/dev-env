#! /bin/sh

: > "$HOME/.fffzzzfff-cache"


for arg in "$@"; do
  find $arg -type f >> "$HOME/.fffzzzfff-cache"
done
