# Clear screen
function clear
    echo -e '\033[0m\033[?25h '
    command clear
end
abbr clera 'clear'
abbr lea 'clear'

# Short commands
abbr v 'nvim'
abbr t 'tmux'
abbr ghostkeys 'ghostty +list-keybinds --default'
abbr tt 'tmux new-session -c'

# Directory shortcuts
abbr denv 'cd ~/personal/dev-env'
abbr denver 'cd ~/personal/dev-env'

# Scripts
abbr wmake '~/personal/dev-env/scripts/make-loop.sh'
abbr wmaker '~/personal/dev-env/scripts/make-loop-r.sh'
abbr wmakeb '~/personal/dev-env/scripts/make-loop-b.sh'
abbr fa '~/personal/dev-env/scripts/fzf-custom.sh'
abbr fal '~/personal/dev-env/scripts/fzf-custom-nonrecursive.sh'
abbr fm '~/personal/dev-env/scripts/fzf-make.sh'

# Files
abbr chat 'nvim ~/chatprompt.md'
abbr zxcv 'nvim ~/zxcv.md'
abbr out 'nvim ~/out'

# Make shortcuts
abbr mk 'make'
abbr mkr 'make r'
abbr mkb 'make b'
abbr mkjr 'make -j r'

# Listing
abbr ll 'ls -alF'
abbr la 'ls -A'
abbr l 'ls -CF'
abbr ls 'ls -a1 --color=auto'
abbr ni 'touch'

# Exit
abbr q 'exit'
abbr x 'exit'
abbr e 'exit'
abbr ew 'exit'

# Quick directory access
abbr no 'cd ~/personal/notes/'
abbr mark 'cd ~/personal/notes/notes_/mark'
abbr typ 'cd ~/personal/notes/notes_/typst'
abbr dev 'cd ~/personal/dev/code'
abbr web 'cd ~/personal/dev/code/web/'
abbr pyt 'cd ~/personal/dev/code/pyt/'
abbr ru 'cd ~/personal/dev/code/rusty/'
abbr gg 'cd ~/personal/dev/code/goprojects/'
abbr zzz 'cd ~/personal/dev/code/zig/'
abbr cpa 'cd ~/personal/dev/code/cpp/'
abbr sha 'cd ~/personal/dev/code/sharpie/'
abbr oc 'cd ~/personal/dev/code/ovaml/'
abbr hasky 'cd ~/personal/dev/code/haskell/'
abbr fs 'cd ~/personal/dev/code/FSHARP/'
abbr note 'cd ~/personal/notes/notes_'

# Compilers and runners
abbr er 'cargo run'
abbr sr 'stack run'
abbr sb 'stack build'
abbr c 'cargo'
abbr p 'python3'
abbr gr 'go run main.go'
abbr zb 'clear; zig build'
abbr d 'cd'
abbr ca 'g++ -o'
abbr db 'dune build'
abbr dr 'dune exec'

# Git
abbr g 'git'
abbr gs 'git status'
abbr ga 'git add .'
abbr gc 'git commit'
abbr gb 'git branch'
abbr gd 'git diff'
abbr gm 'git merge'
abbr gck 'git checkout'
abbr gac 'git commit -a'
abbr gacm 'git commit -am'
abbr gpush 'git push'
abbr gpull 'git pull'
abbr gh 'github'
abbr gl '~/scripts/git-commit-push.sh'

# Misc
abbr lsc 'while true; ls | wc -l; sleep 1; end'
abbr lsd 'find . -maxdepth 1 -mindepth 1 -type d'
abbr r 'ranger'
abbr .. 'cd ..'
abbr dis '$HOME/personal/dev-env/scripts/discord'
abbr code 'code --disable-gpu'
abbr ts '$HOME/personal/dev-env/tmux-sessionizer'

# Functions
function fzd
    set selected (find . ~/ ~/personal ~/personal/dev/ -mindepth 1 -maxdepth 5 -type d -print | fzf)
    if test -n "$selected"
        cd "$selected"
    end
end

function vfz
    set file (fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
    if test -n "$file"
        nvim "$file"
    end
end
