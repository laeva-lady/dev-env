alias v="nvim"
alias vim="nvim"
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
# alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-version=3"
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"

alias outlast="$HOME/personal/dev-env/run"
alias thor="$HOME/personal/dev-env/cmds/installs/pkgs"
alias tmux-sessionizer="$HOME/personal/dev-env/resources/scripts/tmux-sessionizer.sh"

# scripts
alias wmake="$HOME/personal/dev-env/resources/scripts/wmake.sh"

dfz() {
    cd "$(find . -mindepth 1 -maxdepth 5 -type d -print | fzf)"
}
vfz() {
    local file
    if [ -z $1 ]
    then
        file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 0
        [ -n "$file" ] && nvim "$file"
    else
        file=$(find . -type f | grep -i "$1" | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 0
        [ -n "$file" ] && nvim "$file"
    fi
}
rfz() {
    local file
    file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 0
    [ -n "$file" ] && chmod +x "$file" && "$file"
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
