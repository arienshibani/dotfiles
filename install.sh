
#   This installation is destructive, as it removes exisitng files/directories.


echo ""

# Install Homebrew
echo "\033[1m🍺 Homebrew\033[0m"
which -s brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "  Brew is installed"
fi
echo ""


# Install Oh My Zsh
echo "\033[1m😮 Oh My Zsh\033[0m"

ZSH_CUSTOM_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom/}/plugins/zsh-autosuggestions

# Install Plugins
ZSH_AUTOSUGGESTIONS=https://github.com/zsh-users/zsh-autosuggestions
ZSH_COMPLETIONS=https://github.com/zsh-users/zsh-completions
ZSH_SYNTAX_HIGHLIGHTING=https://github.com/zsh-users/zsh-syntax-highlighting.git
GIT_OPEN=https://github.com/paulirish/git-open.git


if [[ -d $ZSH_CUSTOM_DIR ]]
then
  echo "  Looks like Oh My Zsh is already installed"
else
  echo "  Cloning $ZSH_AUTOSUGGESTIONS"
  git clone $ZSH_AUTOSUGGESTIONS $ZSH_CUSTOM_DIR
  echo "  Cloning $ZSH_COMPLETIONS"
  git clone $ZSH_COMPLETIONS $ZSH_CUSTOM_DIR
  echo "  Cloning $ZSH_SYNTAX_HIGHLIGHTING"
  git clone $ZSH_SYNTAX_HIGHLIGHTING $ZSH_CUSTOM_DIR
  echo "  Cloning $GIT_OPEN"
  git clone $GIT_OPEN $ZSH_CUSTOM_DIR
fi
echo ""

# Get path to the current script
SCRIPT_NAME="$(basename ${BASH_SOURCE[0]})"
pushd $(dirname ${BASH_SOURCE[0]}) > /dev/null
SCRIPT_DIR=$(pwd)
popd > /dev/null

# names in this list won't be dot-prefixed
skip_dot_prefix=(nvim, starship.toml)

# contains checks if an array ($2) contains a given element ($1).
contains() {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


# copy or symlink all the dotfiles
echo "\033[1m🔗 Copying dotfiles\033[0m"
UNAME=$(uname | tr '[:upper:]' '[:lower:]')
for path in $SCRIPT_DIR/*; do
  name=$(basename $path)
  case $name in
    *.md|*.sh) continue;;
  esac

  # If there exists a platform-specific version, then use that
  if [ -e "${path}.${UNAME}" ]; then
    echo "Using platform-specific ${name} for ${UNAME}"
    path="${path}.${UNAME}"
  fi

  # If the file is in the skip dot list, then we don't add a dot
  target="$name"
  if ! contains "$name" "${skip_dot_prefix[@]}"; then
    target=".$name"
  fi

  # Build our complete path to the home directory
  target="$HOME/$target"
  if [ -h $target -o -f $target ]; then
    rm $target
  elif [ -d $target ]; then
    rm -rf $target
  fi

  case $UNAME in
    cygwin* | mingw32*)
      cp -R $path "$target"
      echo "  · Copied $name to $target."
      ;;
    *)
      ln -s $path "$target"
      echo "  · Linked $name to $target."
      ;;
  esac
done
echo ""

powerline_fonts() {
  # Install Powerline fonts
  printf "\033[1m⚡️ Install Powerline fonts?\033[0m"
  read -r -p "[Y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
    git clone https://github.com/powerline/fonts.git --depth=1 --quiet
    pushd fonts >/dev/null
    ./install.sh | sed 's/^/  /'
    popd >/dev/null
    rm -rf fonts # clean up after installing font.
    ;;
    *) echo " Skipping...";;
  esac
  echo ""
}



# Brew
brew_bundle() {
  printf "\033[1m🍻 Run 'Brew bundle'?\033[0m"
  HOMEBREW_NO_ENV_HINTS=true
  read -r -p "[Y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
    brew bundle | sed 's/^/ /'
    break;;
    *) echo " Skipping...";
    break;;
  esac
  echo ""
}

vscode_extensions() {
  # VScode extentions
  # Check for code CLI
  printf "\033[1m 🧩 Install suggested VSCode extentions? \033[0m"
  which -s code
  if [[ $? != 0 ]] ; then
    echo "\n  code cli is not installed";
    echo "\n  skipping for now..."
  else
    read -r -p "[Y/N] " response
    case $response in
      [yY][eE][sS]|[yY])
      sh $PWD/.vscode/install-extensions.sh | sed 's/^/  /'
      break;;
      *) echo " Skipping...";
      break;;
    esac
  fi
  echo ""
}

powerline_fonts
brew_bundle
vscode_extensions

echo "\033[1m🔑 Configuring GPG\033[0m"

# Set up GPG (depends on gnupg being installed)
git config --global gpg.program $(which gpg)

if [[ ! -e ~/.gnupg/gpg-agent.conf ]]; then
# Check if the gpg-agent.conf file exists, if not create it and add some configurations
  touch ~/.gnupg/gpg-agent.conf
  echo "default-cache-ttl 46000" >> ~/.gnupg/gpg-agent.conf
  echo "max-cache-ttl 46000" >> ~/.gnupg/gpg-agent.conf
  echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
fi

# Check if gpg-agent is already running, if not start it
printf "  "; gpg-agent;
if [[ $? != 0 ]] ; then
  echo "  ♻️ starting new gpg-agent"
  gpg-agent --daemon
  wait
fi

# Set global gitignore
git config --global core.excludesFile '~/.gitignore'
