#! /bin/sh

make $(awk -F':' '/^[a-zA-Z0-9][^$#\t ]*:/ {print $1}' "Makefile" | fzf)

