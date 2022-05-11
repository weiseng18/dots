# -------------------------------------------------------------------- features
source $ZSH_DOTS/git
source $ZSH_DOTS/misc
source $ZSH_DOTS/oneliners
source $ZSH_DOTS/nav
source $ZSH_DOTS/prompt

# -------------------------------------------------------------------- env vars
export REPOS=$HOME/repos
export DOTS=$REPOS/dots
export ZSH_DOTS=$HOME/.config/zsh

export NOTES_CONFIG=$REPOS/uni/config
export NAVI_PATH=$DOTS/navi

export EDITOR=nvim
export LESSHISTFILE=-
[ $EDITOR = "nvim" ] && export MANPAGER="nvim +Man!"

# ---------------------------------------------------------------- app specific
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# fzf fuzzy autocompletion and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --------------------------------------------------------------- shell options

setopt globdots # enable zsh completion to show hidden files and folders
set -o ignoreeof # help with accidental control-D

# enable zprof
zmodload zsh/zprof

