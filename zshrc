export ZSH="$HOME/.oh-my-zsh"
export KUBE_EDITOR='code --wait'
export DOTNET_ROOT=/usr/local/share/dotnet/sdk/6.0.422
export GPG_TTY=$(tty)

ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat sportskalender-in-terminal)

# Quick-edit Config Files 📝
alias editrc='code ~/.zshrc'
alias editgit='git config --global --edit'
alias editaws="code ~/.aws/config"
alias editkube="code ~/.kube/config"

# Navigation helpers 🧭
alias repos='cd ~/repos'
alias leabank='cd ~/repos/leabank-cf'
alias avida='cd ~/repos/avida-cf'

# Utilities 🛠
alias k="kubectl"
alias py="python3"
alias nuke='rm -rf'
alias chrome="open -a 'Google Chrome'"
alias camunda="open -a 'Camunda Modeler'"
alias cat="/opt/homebrew/bin/bat"
alias ls='ls -la --color=auto'
alias sauce='source ~/.zshrc'
alias ports="lsof -PiTCP -sTCP:LISTEN" # List all open ports
alias givekeys="pbcopy < ~/.ssh/id_rsa.pub" # Copies your SSH key to your clipboard
alias swiss-army-knife="kubectl run swiss-army-knife --rm -i --tty --image nicolaka/netshoot -- /bin/bash" # A swiss army knife for networkdebugging in k8s.
alias killport='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp' # Shuts down whatever is running on a given port.
alias prunelocal='git branch | grep -v "main" | xargs git branch -D' # Delete all local branches except main in whatever repo you're in.
alias nvm="fnm" # fnm is a faster version of nvm, so I alias it to nvm.

# Display custom Stacc logo neofetch, unless the terminal is opened in in VSCode.
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  neofetch --ascii ~/.config/neofetch/ascii-art/stacc.txt
fi

source $ZSH/oh-my-zsh.sh
# fnm
FNM_PATH="/Users/ari/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/ari/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
