export ZSH="$HOME/.oh-my-zsh"

export PATH="/home/alice/.local/bin:$PATH"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git fzf-tab)

source $ZSH/oh-my-zsh.sh

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

export EDITOR='nvim'
export VISUAL="$EDITOR"

export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%(?.%F{green}⏺.%F{red}⏺)%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
 '

RPROMPT='%F{8} %*%f'
