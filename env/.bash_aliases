alias v="nvim"
alias vim="nvim"
alias t="tmux"
alias tt="tmux new-session -c"

alias ff="fastfetch"
alias maple="~/personal/maple2024/bin/xmaple"

alias denv="cd ~/personal/dev-env"


 alias fa="~/personal/dev-env/scripts/fzf-custom.sh"
alias fal="~/personal/dev-env/scripts/fzf-custom-nonrecursive.sh"

alias chat="nvim ~/chatprompt.md"
alias zxcv="nvim ~/zxcv.md"
alias fair="nvim ~/fair.md"
 alias out="nvim ~/out"

alias mk="make"
alias mkr="make r"

# listing
alias ls="eza -a1 -s type"


# lazy ass bum
alias e="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."
alias ni="touch" # ni from New-Item's alias on PowerShell (don't ask why)
alias clock="tty-clock"
alias dis="discord"
alias code="code --disable-gpu"
alias conrun="$HOME/personal/dev-env/run"


# quick dir access
 alias note="cd ~/personal/notes/notes_"
 alias mark="cd ~/personal/notes/notes_/mark"
  alias dev="cd ~/personal/dev"

# git stuff
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gac="git commit -a"
alias gacm="git commit -am"
alias gpush="git push"
alias gpull="git pull"

dfz() {
    local selected
    selected=$(find ~/personal -mindepth 1 -maxdepth 5 -type d -print | fzf)
    [[ -z $selected ]] && return
    cd "$selected"
}
vfz() {
    local file
    if [ -z $1 ]
    then
        while true; do
            file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 1
            [ -n "$file" ] && nvim "$file"
        done
    else
        while true; do
            file=$(find . -type f | grep -i "$1" | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 1
            [ -n "$file" ] && nvim "$file"
        done
    fi
}
wmake() {
    while true; do
        make $1
        echo
        echo
        echo
        echo
        read -p "Waiting on input..."
    done
}
battery() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage:/ { print $2 }'
}

