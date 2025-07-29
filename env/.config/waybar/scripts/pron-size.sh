#!/usr/bin/bash

size=$(du -sh "$HOME/personal/pr0n" | awk '{print $1}')

echo "$size"
