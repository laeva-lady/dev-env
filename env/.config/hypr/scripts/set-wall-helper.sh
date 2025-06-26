#!/usr/bin/bash

fzf \
    --preview="grep {} "'"$filename"'""
        | cut -d\"|\" -f2- \
        | xargs chafa --size=70x" \
    --preview-window=right:70%:wrap \
    < "'"$tmp_options"'" > "'"$choice_tmp"'"
