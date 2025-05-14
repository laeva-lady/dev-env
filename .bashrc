#  why doesnt vscode fucking find it jesus christ
# export PATH=$PATH:/snap/bin/zig

# xrdb -merge ~/.xresources
case $- in
*i*) ;;
*) return ;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto '
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ///////////////////////////////////////////
# ///////////////////////////////////////////

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# PS1='$? \033[31m| \w \033[35m:|> \033[0m'
set_prompt() {
    # local EXIT="$?"
    # local GREEN="\033[32m"
    # local RED="\033[31m"
    # local RESET="\033[0m"
    # local PS_STATUS
    #
    # if [ $EXIT -eq 0 ]; then
    #     PS_STATUS="${GREEN}[${EXIT}]${RESET}"
    # else
    #     PS_STATUS="${RED}[${EXIT}]${RESET}"
    # fi
    #
    # local CYAN="\033[36m"
    # local PURP="\033[35m"
    # local BOLD="\033[1m"
    # PS1="${PS_STATUS}\W >>> \033[0m"
    #
    #
    #
    ## depending on the shell, sometimes it leaves artifacts and stuff
    ##################################################################

    # columns=$(stty -a | grep -Po '(?<=columns )\d+')
    # str=$(printf '%*s' "$columns" '' | tr ' ' '=')
    #

    PS1="[ \u @ \w ]\n ; "
}

PROMPT_COMMAND=set_prompt

# eval $(opam env)

# [ -f "/home/alice/.ghcup/env" ] && . "/home/alice/.ghcup/env" # ghcup-env
#
# . "/home/alice/.deno/env"

# . "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"


export VISUAL=nvim
export EDITOR="$VISUAL"

export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx



# why the fuck is .bash_aliases not working...
# move this shit back there if i find why
alias clear="echo -e '\033[0m\033[?25h '; clear"
alias clera="clear"
alias lea="clear"

alias v="nvim"
alias t="tmux"

alias ghostkeys="ghostty +list-keybinds --default"

alias tt="tmux new-session -c"

alias denv="cd ~/personal/dev-env"
alias denver="cd ~/personal/dev-env"

alias wmake="~/personal/dev-env/scripts/make-loop.sh"
alias wmaker="~/personal/dev-env/scripts/make-loop-r.sh"
alias wmakeb="~/personal/dev-env/scripts/make-loop-b.sh"

 alias fa="~/personal/dev-env/scripts/fzf-custom.sh"
alias fal="~/personal/dev-env/scripts/fzf-custom-nonrecursive.sh"
 alias fm="~/personal/dev-env/scripts/fzf-make.sh"

alias chat="v ~/chatprompt.md"
alias zxcv="v ~/zxcv.md"
alias out="v ~/out"
alias note="cd ~/personal/notes/notes_"

alias mk="make"
alias mkr="make r"
alias mkb="make b"
alias mkjr="make -j r"

# listing
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ls="ls -a1 --color=auto"
alias ni="touch"

# lazy ass bum
alias q="exit"
alias x="exit"
alias e="exit"
alias ew="exit"

# quick dir access
   alias no="cd ~/personal/notes/"
 alias mark="cd ~/personal/notes/notes_/mark"
  alias typ="cd ~/personal/notes/notes_/typst"
  alias dev="cd ~/personal/dev/code"
  alias web="cd ~/personal/dev/code/web/"
  alias pyt="cd ~/personal/dev/code/pyt/"
   alias ru="cd ~/personal/dev/code/rusty/"
   alias gg="cd ~/personal/dev/code/goprojects/"
  alias zzz="cd ~/personal/dev/code/zig/"
  alias cpa="cd ~/personal/dev/code/cpp/"
  alias sha="cd ~/personal/dev/code/sharpie/"
   alias oc="cd ~/personal/dev/code/ovaml/"
alias hasky="cd ~/personal/dev/code/haskell/"
   alias fs="cd ~/personal/dev/code/FSHARP/"

# compiler shorthands
alias er="cargo run"
alias sr="stack run"
alias sb="stack build"
 alias c="cargo"
 alias p="python3"
alias gr="go run main.go"
alias zb="clear; zig build"
 alias d="cd"
alias ca="g++ -o"
alias db="dune build"
alias dr="dune exec"

# git stuff
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gb="git branch"
alias gd="git diff"
alias gm="git merge"
alias gck="git checkout"
alias gac="git commit -a"
alias gacm="git commit -am"
alias gpush="git push"
alias gpull="git pull"
alias gh="github"
alias gl="~/scripts/git-commit-push.sh"

# bruh
alias lsc="while :; do ls | wc -l ; done"
alias lsd="find . -maxdepth 1 -mindepth 1 -type d"
alias r="ranger"

alias ..="cd .."
alias ?="echo $?"

alias dis="$HOME/personal/dev-env/scripts/discord"
alias code="code --disable-gpu"


fzd() {
    local selected
    selected=$(find ~/ ~/personal ~/personal/dev/ -mindepth 1 -maxdepth 5 \( -path '*/.*' -prune \) -o -type d -print | fzf)
    [[ -z $selected ]] && return
    cd "$selected"
}
vfz() {
    local file
    file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") || return 1
    [ -n "$file" ] && nvim "$file"
}
alias ts="$HOME/personal/dev-env/tmux-sessionizer"


# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init bash)"
