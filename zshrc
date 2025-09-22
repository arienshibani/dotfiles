export ZSH="$HOME/.oh-my-zsh"
export KUBE_EDITOR='zed --wait'
export DOTNET_ROOT=/usr/local/share/dotnet/sdk/6.0.422
export GPG_TTY=$(tty)
export KUBECONFIG=$(PWD)/.kubeconfig

ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)

# Quick-edit Config Files 📝
alias editrc='zed ~/.zshrc'
alias editgit='git config --global --edit'
alias editaws="zed ~/.aws/config"
alias editkube="zed ~/.kube/config"
alias editstarship="zed ~/.config/starship.toml"

# Navigation helpers 🧭
alias repos='cd ~/repos'
alias leabank='cd ~/repos/leabank-cf'
alias avida='cd ~/repos/avida-cf'
alias avidacard='cd ~/repos/avida-card'
alias intrum='cd ~/repos/intrum'
alias opf="cd ~/repos/bolig-opf"
alias lba="cd ~/repos/bolig-lba"
alias pbi="cd ~/repos/power-bi-report-manager"

# Utilities 🛠
alias k="kubectl"
alias localKube='export KUBECONFIG=$(PWD)/.kubeconfig'
alias globalKube='unset KUBECONFIG'
alias py="python3"
alias pip="pip3"
alias python="python3"
alias nuke='rm -rf'
alias chrome="open -a 'Google Chrome'"
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
alias makeauth=" ~/acr-login-loop.sh"

# logs
alias slipa="stacc logs integration-proxy-api"
alias slof="stacc logs flow-process"
alias sl="stacc logs"
alias kafaenSkjeddeIFlowEgentlig="k logs flow-process > sedå.json"

# Jobba!
alias open-dev='osascript ~/Scripts/launch_terminals.scpt'


# Display neofetch, unless the terminal is opened in in VSzed.
if [[ "$TERM_PROGRAM" != "vszed" ]]; then
  neofetch --ascii ~/.config/neofetch/ascii-art/stacc.txt
fi

export GPG_TTY=$(tty)
source $ZSH/oh-my-zsh.sh
# fnm
FNM_PATH="/Users/ari/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/ari/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
. "/Users/ari/.deno/env"
# pnpm
export PNPM_HOME="/Users/ari/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


alias splititerm='osascript -e "tell application \"iTerm\"
    if not (exists window 1) then
        create window with default profile
        tell current session of current window
            split horizontally with default profile
            delay 0.5
            split vertically with default profile
        end tell
    end if
end tell"'

export PATH="$PATH:/usr/local/share/dotnet"


# pyenv setup
. "$HOME/.local/bin/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Load enhanced make command
source ~/repos/makeup/makeup.plugin.zsh

eval "$(starship init zsh)"
