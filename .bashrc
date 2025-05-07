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

. "$HOME/.cargo/env"

# fnm
FNM_PATH="/home/alice/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
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

    PS1="[ \w ]\n ; "
}

PROMPT_COMMAND=set_prompt

# eval $(opam env)

# [ -f "/home/alice/.ghcup/env" ] && . "/home/alice/.ghcup/env" # ghcup-env
#
# . "/home/alice/.deno/env"

# . "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"


export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
export PATH=$PATH:/opt/nvim-linux64/bin
. "$HOME/.cargo/env"

export VISUAL=nvim
export EDITOR="$VISUAL"


. <(asdf completion bash)





# why the fuck is .bash_aliases not working...
# move this shit back there if i find why
alias clear="echo -e '\033[0m\033[?25h '; clear"
alias clera="clear"
alias lea="clear"

alias v="nvim"
alias t="tmux"

alias tt="tmux new-session -c"

alias wmake="~/scripts/make-loop.sh"
alias wmaker="~/scripts/make-loop-r.sh"
alias wmakeb="~/scripts/make-loop-b.sh"

 alias fa="~/personal/dev-env/scripts/fzf-custom.sh"
alias fal="~/personal/dev-env/scripts/fzf-custom-nonrecursive.sh"
alias faf="~/personal/dev-env/scripts/fzf-custom.sh ."
 alias fm="~/personal/dev-env/scripts/fzf-make.sh"
# alias fac="v $(cat ~/.fffzzzfff-cache | fzf --preview "cat {}" | grep -v "/$")"
alias mfc="~/scripts/fzf-make-cache.sh"
#
alias scr="cd ~/scripts/"
alias ser="v ~/scratch.md"
alias chat="v ~/chatprompt.md"
alias todo="v /mnt/c/notes/todo.md"
alias buf="v /mnt/c/notes/buffer.Rmd"
alias note="cd ~/notes/notes_"
alias lst="ls --color=always | awk {print '\t' $0}"
alias notep="cmd.exe /c 'C:/Program Files/Notepad++/notepad++.exe'"

alias mm="micro"

alias mk="make"
alias mkr="make r"
alias mkb="make b"
alias mkjr="make -j r"
alias ex="explorer.exe"
# listing
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ls="ls -a1 --color=auto"
alias ni="touch"
# "exit" is too long to type

alias exit="clear ; exit"
alias q="exit"
alias x="exit"
alias e="exit"
alias ew="exit"

# quick dir access
alias files="cd /mnt/d/files"
 alias grip="cd /mnt/d/grapper/"
  alias dsk="cd /mnt/c/Users/valky/OneDrive/Bureau"
   alias no="cd ~/notes/"
  alias dnv="cd ~/.config/nvim/"
  alias dev="cd ~/dev/code"
  alias web="cd ~/dev/code/web/"
  alias pyt="cd ~/dev/code/pyt/"
   alias ru="cd ~/dev/code/rusty/"
   alias gg="cd ~/dev/code/goprojects/"
  alias zzz="cd ~/dev/code/zig/"
  alias cpa="cd ~/dev/code/cpp/"
  alias sha="cd ~/dev/code/sharpie/"
   alias oc="cd ~/dev/code/ovaml/"
alias hasky="cd ~/dev/code/haskell/"
   alias fs="cd ~/dev/code/FSHARP/"
 alias pyte="v  ~/dev/code/pyt/pythonProject/scratch.py"
 alias mark="cd ~/notes/notes_/mark"
  alias typ="cd ~/notes/notes_/typst"

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

# opeinign stuff
alias vc="code"
alias wic="cmd.exe /c code "
alias sln="cmd.exe /c *.sln"
alias kate="cmd.exe /c kate"
alias rr="ranger /"
alias obs="/mnt/c/Users/valky/AppData/Local/Obsidian/Obsidian.exe"
alias yr="~/.local/bin/yt-dlp"
alias mpv="mpv.exe"
alias power="powershell.exe"
alias ..="cd .."
alias ?="echo $?"

# start venv
alias venv="source /mnt/c/dev/code/pyt/alice-s-venv/bin/activate"

