# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

export PATH=$PATH:/usr/local/go/bin

plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-bat
)
# Quick-edit Config Files 📝
alias editrc='cursor ~/.zshrc'
alias editgit='git config --global --edit'

# Navigation helpers 🧭
alias repos='cd ~/repos'

# General Utilities 🛠
alias sauce='source ~/.zshrc && echo "🍝 ZSH run commands refreshed. " '
alias nuke='rm -rf'
alias ls='ls -la --color=auto'
alias prunelocal='git branch | grep -v "main" | xargs git branch -D' # Delete all local branches except main in whatever repo you're in.

# Language / Software Utilities 🌐
alias k="kubectl"
alias py='python3'
alias pip='pip3'

eval "$(direnv hook zsh)"
source $ZSH/oh-my-zsh.sh

