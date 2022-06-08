# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    colored-man-pages
    colorize
    pip
    python
    brew
    macos
    zsh-syntax-highlighting
    zsh-autosuggestions
    git-open
    kubectl
    direnv
    docker
)

source $ZSH/oh-my-zsh.sh



# For a full list of active aliases, run `alias`.
alias sauce="source ~/.zshrc"
alias please='sudo $(fc -ln -1)'
alias k="kubectl"
alias nuke="rm -r"
alias gibekeys="pbcopy < ~/.ssh/id_rsa.pub"
alias editrc="nano ~/.zshrc"
alias chrome="open -a 'Google Chrome'"
alias camunda="open -a 'Camunda Modeler'"
