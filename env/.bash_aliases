alias v="nvim"
alias t="tmux"
alias tt="tmux new-session -c"

alias neofetch="fastfetch"

alias denv="cd ~/personal/dev-env"

alias wmake="~/personal/dev-env/scripts/make-loop.sh"
alias wmaker="~/personal/dev-env/scripts/make-loop-r.sh"
alias wmakeb="~/personal/dev-env/scripts/make-loop-b.sh"

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
    selected=$(find . ~/personal ~/personal/dev/ -mindepth 1 -maxdepth 5 -type d -print | fzf)
    [[ -z $selected ]] && return
    cd "$selected"
}
vfz() {
    local file
    if [ -z $1 ]
    then
        file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 1
        [ -n "$file" ] && nvim "$file"
    else
        file=$(find . -type f | grep -i "$1" | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 1
        [ -n "$file" ] && nvim "$file"
    fi
}
