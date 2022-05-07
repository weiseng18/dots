source $ZSH_DOTS/git
source $ZSH_DOTS/misc
source $ZSH_DOTS/oneliners
source $ZSH_DOTS/nav

# enable zsh completion to show hidden files and folders
setopt globdots

# help with accidental control-D
set -o ignoreeof

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
