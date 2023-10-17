# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

export KUBE_EDITOR='code --wait'

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf
    zsh-syntax-highlighting
    zsh-autosuggestions
    git-open
)

source $ZSH/oh-my-zsh.sh

# Clean up terminal context (remove this is you want to keep it)
prompt_context(){}

# Set personal aliases, overriding those provided by oh-my-zsh libs.
alias editrc="code ~/.zshrc"
alias cat="/opt/homebrew/bin/bat"
alias ls='ls -la --color=auto'
alias ports="lsof -PiTCP -sTCP:LISTEN"
alias sauce="source ~/.zshrc"
alias k="kubectl"
alias nuke="rm -r"
alias givekeys="pbcopy < ~/.ssh/id_rsa.pub"
alias editrc="code ~/.zshrc"
alias editkubeconfig="code ~/.kube/config"
alias chrome="open -a 'Google Chrome'"
alias camunda="open -a 'Camunda Modeler'"
alias killport='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp'

# Shortcuts for our customers projects:
alias leabank="cd ~/repos/leabank-cf"
alias avida="cd ~/repos/avida-cf"

export PATH="$HOME/scripts:$PATH"
eval "$(direnv hook zsh)"
