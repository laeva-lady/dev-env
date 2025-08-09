export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export WORKSTATION="$HOME/personal/denver"
export PATH="$WORKSTATION/bin:$PATH"

export PKG_PATH_YAML="$WORKSTATION/resources/pkg.yaml"
export BROWSER_CONFIG_PATH="$HOME/.zen/crjkc5yv.Default (release)"


ZSH_THEME="robbyrussell"
# ENABLE_CORRECTION="true"

plugins=(
    git
    fzf-tab
    battery
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases.sh ] && source ~/.aliases.sh

export EDITOR="nvim"
export VISUAL="$EDITOR"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %F{cyan}(%f%F{red}%b%f%F{cyan})%f'

setopt PROMPT_SUBST
PROMPT='%(?.%F{green}>.%F{red}>) %F{blue}%~%f${vcs_info_msg_0_}%F{yellow}
;%f '
# RPROMPT='%F{8} %* $(battery)%% %f'


# opam configuration
[[ ! -r '/home/alice/.opam/opam-init/init.zsh' ]] || source '/home/alice/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

bindkey -s ^t "^utmux-sessionizer\n"
bindkey -s ^f "^uvfz\n"
bindkey -s ^e "^ucode .\n"

# if [[ -z "$(ps aux | pgrep tmux)" ]]; then
#     tmux-sessionizer "$HOME"
# fi

# eval "$(starship init zsh)"
