export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

ZSH_THEME="robbyrussell"
# ENABLE_CORRECTION="true"

plugins=(
    git
    fzf-tab
    battery
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases ] && source ~/.aliases

export EDITOR='nvim'
export VISUAL="code"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%(?.%F{green}>.%F{red}>) %F{blue}%~%f %F$f%F{red}${vcs_info_msg_0_}%f%F{yellow}x%f '

RPROMPT='%F{8} %* $(battery)%% %f'


# opam configuration
[[ ! -r '/home/alice/.opam/opam-init/init.zsh' ]] || source '/home/alice/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

bindkey -s ^t "^utmux-sessionizer\n"
bindkey -s ^f "^uvfz\n"
