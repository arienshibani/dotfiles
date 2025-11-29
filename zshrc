export ZSH="$HOME/.oh-my-zsh"
export KUBE_EDITOR='cursor --wait'
export DOTNET_ROOT=/usr/local/share/dotnet/sdk/6.0.422
export GPG_TTY=$(tty)
export KUBECONFIG=$(PWD)/.kubeconfig

ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)

# Quick-edit Config Files 📝
alias editrc='cursor ~/.zshrc'
alias editgit='git config --global --edit'
alias editkube="cursor ~/.kube/config"


# Navigation helpers 🧭
alias repos='cd ~/repos'

# Utilities 🛠
alias nuke='rm -rf'
alias k="kubectl"
alias localKube='export KUBECONFIG=$(PWD)/.kubeconfig'
alias globalKube='unset KUBECONFIG'

alias chrome="open -a 'Vivaldi'"
alias camunda="open -a 'Camunda Modeler'"
alias cat="/opt/homebrew/bin/bat"
alias ls='ls -la --color=auto'
alias sauce='source ~/.zshrc && echo "🍝 ZSH run commands refreshed. " '
alias ports="lsof -PiTCP -sTCP:LISTEN" # List all open ports
alias givekeys="pbcopy < ~/.ssh/id_rsa.pub" # Copies your SSH key to your clipboard
alias killport='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp' # Shuts down whatever is running on a given port.
alias prunelocal='git branch | grep -v "main" | xargs git branch -D' # Delete all local branches except main in whatever repo you're in.
alias nvm="fnm" # fnm is a faster version of nvm, so I alias it to nvm.
alias swiss-army-knife="kubectl run swiss-army-knife --rm -i --tty --image nicolaka/netshoot -- /bin/bash" # A swiss army knife for debugging in k8s.




export PATH="$PATH:/usr/local/share/dotnet"

_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/opt/homebrew/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

# Load enhanced make command
source ~/repos/makeup/makeup.plugin.zsh

eval "$(starship init zsh)"
