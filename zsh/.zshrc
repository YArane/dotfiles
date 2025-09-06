# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pygmalion"

# plugins
plugins=(
  docker
  docker-compose
  git
  helm
  kubectl
  minikube
  mvn
  ssh
  zsh-autosuggestions
)

# Skip all plugin aliases
zstyle ':omz:plugins:*' aliases no

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
unsetopt share_history

# aliases
alias vi="nvim"

## ls -> eza
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --no-permissions --group-directories-first --total-size'
alias llm='eza -lb --header --git --sort=modified --color=always --icons'
alias lls='eza -lb --header --git --sort=size --reverse --color=always --icons --total-size'
alias la='eza -la --icons --octal-permissions --group-directories-first --total-size'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons --total-size'
alias l='eza -1 --color=always --group-directories-first --icons'
lt() {
  local level=${1:-2}
  eza --tree --level="$level" --color=always --group-directories-first --icons
}

## bat
alias cat='batcat -pp'

set -o ignoreeof # prevent Ctrl-d from exiting shell

if [ "$TMUX" = "" ]; then tmux; fi # launch tmux on startup

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --margin=0 --padding=0 --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'
