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

# listing
alias ls="eza -a1 -s type"

# lazy ass bum
alias e="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."
alias mk="make"
alias mkr="make r"
alias ni="touch" # ni from New-Item's alias on PowerShell (don't ask why)
alias clock="tty-clock"
alias code="code --disable-gpu"
alias conrun="$HOME/personal/dev-env/run"



# quick dir access
 alias note="cd ~/personal/notes/"
 alias mark="cd ~/personal/notes/mark"
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

# scripts
alias wmake="$HOME/personal/dev-env/env/scripts/wmake.sh"
dfz() {
    local selected
    if [ -z $1 ]
    then
        selected=$(find . -mindepth 1 -maxdepth 5 -type d -print | fzf)
    else
        selected=$(find . -mindepth 1 -maxdepth 5 -type d -print | grep -i "$1"| fzf)
    fi
    [[ -z $selected ]] && return
    cd "$selected"
}
tfz() {
    local selected
    if [ -z $1 ]
    then
        selected=$(find . -mindepth 1 -maxdepth 5 -type d -print | fzf)
    else
        selected=$(find . -mindepth 1 -maxdepth 5 -type d -print | grep -i "$1"| fzf)
    fi
    [[ -z $selected ]] && return
    tmux new-session -c "$selected"
}
vfz() {
    local file
    if [ -z $1 ]
    then
        while true; do
            file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 0
            [ -n "$file" ] && nvim "$file"
        done
    else
        while true; do
            file=$(find . -type f | grep -i "$1" | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 0
            [ -n "$file" ] && nvim "$file"
        done
    fi
}
battery() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage:/ { print $2 }'
}
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
