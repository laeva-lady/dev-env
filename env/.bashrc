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

export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx5

export XKB_DEFAULT_LAYOUT="us,ca"
export XKB_DEFAULT_VARIANT=",fr-colemak"
export XKB_DEFAULT_OPTIONS="grp:win_space_toggle,caps:escape"

if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi

# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init bash)"
