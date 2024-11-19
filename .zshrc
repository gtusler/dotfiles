# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ========================
# ZSH CUSTOMISATION

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    autojump
    copyfile
    git
)

# customise oh-my-zsh completion dump location
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"

source $ZSH/oh-my-zsh.sh

# load powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh

# load syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load completions
source ~/.zsh-completions/uv

# ========================
# EDITOR

# neovim
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin" # nvim version manager


# ========================
# PERSONAL THINGS

# need those aliases
source $HOME/.config/aliases/.aliases

# a mess of user-specific dirs
export PATH="$PATH:$HOME/dev/bin"
export PATH="$PATH:$HOME/dev/bin/clit" # Hopefully won't need this for much longer
export PATH="$PATH:$HOME/dev/bin/tse/scripts"
export PATH="$PATH:$HOME/.local/bin"


# ========================
# LANGUAGES

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/govi/.bun/_bun" ] && source "/home/govi/.bun/_bun" # completions

# pnpm
export PNPM_HOME="/home/govi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# deno
. "$HOME/.deno/env"

# go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
