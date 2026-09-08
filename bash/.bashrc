case $- in
*i*) ;;
*) return;;
esac

# User configuration

# Generated for envman. Do not edit.

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH=$PATH:$HOME/.local/opt/go/bin

eval "$(fasd --init auto)"

export PATH="$HOME/bin:$PATH"

alias vi='nvim'
alias ls='lsd'
alias ranger='TERM=kitty ranger'
alias chafa='chafa -f kitty'
alias show='bash ~/suckless/st/icat-mini.sh'

[ -f "$HOME/.cache/wal/sequences" ] && cat "$HOME/.cache/wal/sequences"

# Bun

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Cargo

export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# Starship prompt

eval "$(starship init bash)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Added by Antigravity CLI installer
export PATH="/home/abhijith/.local/bin:$PATH"
