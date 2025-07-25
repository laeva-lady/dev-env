alias v="nvim"
alias vim="nvim"
alias cim="nvim -u ~/.config/nvim/min-init.lua"

alias t="tmux"
alias tt="tmux new-session -c"

alias ff="fastfetch"

alias chat="nvim ~/chat.md"
alias zxcv="nvim ~/zxcv.md"
alias fair="nvim ~/personal/notes/todo.md"

# listing
alias ls="eza -a1 -s type"

# lazy ass bum
alias e="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."

alias g="git"
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gc="git commit"
alias gcm="git commit -m"
alias gac="git commit -a"
alias gacm="git commit -am"
alias gpush="git push"
alias gpull="git pull"


xway() {
    hyprctl clients -j | jq -r '.[] | "\(.class) : \(.xwayland)"'
}
battery() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage:/ { print $2 }'
}
