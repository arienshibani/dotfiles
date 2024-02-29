export ZSH="$HOME/.oh-my-zsh"
export KUBE_EDITOR='code --wait'

ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)

# Quic-edit Config Files 📝
alias editrc='code ~/.zshrc'
alias editgit='git config --global --edit'
alias editaws="code ~/.aws/config"
alias editkube="code ~/.kube/config"

# Navigation helpers 🧭
alias repos='cd ~/repos'
alias leabank='cd ~/repos/leabank-cf'
alias avida='cd ~/repos/avida-cf'

#  Utilities 🛠
alias k="kubectl"
alias nuke='rm -rf'
alias sauce='source ~/.zshrc'
alias chrome="open -a 'Google Chrome'"
alias camunda="open -a 'Camunda Modeler'"
alias givekeys="pbcopy < ~/.ssh/id_rsa.pub"
alias cat="/opt/homebrew/bin/bat"
alias ls='ls -la --color=auto'
alias ports="lsof -PiTCP -sTCP:LISTEN" # List all open ports
alias killport='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp' # Shuts down whatever is running on a given port
alias prunelocal='git branch | grep -v "main" | xargs git branch -D' # Delete all local branches except main

source $ZSH/oh-my-zsh.sh

prompt_context() {
  # Random emoji for the prompt context
  emojis=("🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🚦" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment default "${emojis[$RAND_EMOJI_N]} "
}
