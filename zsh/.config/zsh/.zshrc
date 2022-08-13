# -------------------------------------------------------------------- env vars
export REPOS=$HOME/repos
export DOTS=$REPOS/dots
export ZSH_DOTS=$DOTS/zsh/.config/zsh

export NOTES_CONFIG=$REPOS/uni/config
export NAVI_PATH=$DOTS/navi

# modtree
export MODTREE_ENV_SOURCE=$REPOS/orbital/env

export EDITOR=nvim
export LESSHISTFILE=-
[ $EDITOR = "nvim" ] && export MANPAGER="nvim +Man!"

# setup java
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# jdtls-launcher
export PATH=$PATH:$HOME/.local/bin

# ---------------------------------------------------------------- app specific
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# fzf fuzzy autocompletion and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# to let git status use gs
alias ghostscript="/usr/local/bin/gs"

# Keybindings
# CTRL+R for fzf auto completion
# CTRL+G for navi

# -------------------------------------------------------------------- features
source $ZSH_DOTS/git
source $ZSH_DOTS/misc
source $ZSH_DOTS/oneliners
source $ZSH_DOTS/nav
source $ZSH_DOTS/prompt

# --------------------------------------------------------------- shell options

setopt globdots # enable zsh completion to show hidden files and folders
set -o ignoreeof # help with accidental control-D

# enable zprof
zmodload zsh/zprof


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/weiseng/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/weiseng/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/weiseng/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/weiseng/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

