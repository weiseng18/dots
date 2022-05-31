# -------------------------------------------------------------------- env vars
export REPOS=$HOME/repos
export DOTS=$REPOS/dots
export ZSH_DOTS=$DOTS/zsh/.config/zsh

export NOTES_CONFIG=$REPOS/uni/config
export NAVI_PATH=$DOTS/navi

export EDITOR=nvim
export LESSHISTFILE=-
[ $EDITOR = "nvim" ] && export MANPAGER="nvim +Man!"

# setup java
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# jdtls-launcher
export PATH=$PATH:$HOME/.local/bin

# -------------------------------------------------------------------- features
source $ZSH_DOTS/git
source $ZSH_DOTS/misc
source $ZSH_DOTS/oneliners
source $ZSH_DOTS/nav
source $ZSH_DOTS/prompt

# ---------------------------------------------------------------- app specific
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# fzf fuzzy autocompletion and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Keybindings
# CTRL+R for fzf auto completion
# CTRL+G for navi

# --------------------------------------------------------------- shell options

setopt globdots # enable zsh completion to show hidden files and folders
set -o ignoreeof # help with accidental control-D

# enable zprof
zmodload zsh/zprof

