# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    autojump
    copyfile
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# Custom stuff
export EDITOR="nvim"

export PATH="$PATH:$HOME/dev/bin"
export PATH="$PATH:$HOME/dev/bin/tse/scripts"

export PATH="$PATH:$HOME/.local/bin"

# nvim version manager
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

# need those aliases
source $HOME/.config/aliases/.aliases


# Bun completions
[ -s "/home/govi/.bun/_bun" ] && source "/home/govi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# possibly run on launch?
# neofetch

