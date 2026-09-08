if [[ -f ~/.cache/wal/sequences ]]; then
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors.sh
fi
eval "$(zoxide init zsh)"


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found


autoload -Uz compinit
compinit

zinit cdreplay -q

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# accept autosuggestion with Ctrl+Space

bindkey '^ ' autosuggest-accept


HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


alias ls='lsd'
alias vi='nvim'
alias mkdir='mkdir -v'
alias rm='rm -v'
alias chafa='chafa -f kitty'
alias ranger='TERM=kitty ranger'
alias show='bash ~/suckless/st/icat-mini.sh'
alias spotify_player='TERM=xterm-kitty spotify_player'
 # git
alias gc='git commit --verbose'

alias gs='git status'

alias gl='git log --oneline --graph --decorate --all'

eval "$(fzf --zsh)"


eval "$(starship init zsh)"

. "$HOME/.cargo/env"

export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/abhijith/.opencode/bin:$PATH

# Go Environment Variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Added by Antigravity CLI installer
export PATH="/home/abhijith/.local/bin:$PATH"
