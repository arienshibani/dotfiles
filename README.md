# Ari's Dotfiles

Everything I need on a fresh OSX machine. Installed by one script.


* 🍺 Installs [Homebrew](https://brew.sh/) (macOS / Linux)
  * then proceeds to install all the software described in the `Brewfile` via Homebrew 🤝
* 😮 Sets up [Oh My Zsh](https://ohmyz.sh/) and a good `.zshrc` config
* 🔌 Installs the [Powerline font](https://github.com/powerline/fonts)  for the terminal
* 🧩 Installs all the VSCode extensions I need
* 🔑 Configures GPG for me, so I can sign my commits from the get go! ✍️

## Quick start

```bash
git clone git@github.com:stacc/onboarding-script.git
cd onboarding-script
sh install.sh
```

## `sh install.sh`

**Automagically** sets up my stuff on a brand new OS X or Linux machine 🪄

```zsh
🍺 Homebrew
  Brew is installed.

😮 Oh My Zsh
  Looks like Oh My Zsh is already installed

🔗 Copying dotfiles
  · Linked Brewfile to /Users/ari/.Brewfile.
  · Linked gitconfig to /Users/ari/.gitconfig.
  · Linked zshrc to /Users/ari/.zshrc.

⚡️ Install Powerline fonts?[Y/N] y
  Copying fonts...
  Powerline fonts installed to /Users/ari/Library/Fonts

🍻 Run 'Brew bundle'?[Y/N] y
 Using homebrew/bundle
 Using homebrew/cask
 Using homebrew/core
 Using homebrew/cask-fonts
 Using font-fira-code-nerd-font
 Using gh
 Using node
 Using fnm
 Using helm
 Using helmfile
 Using kubectl
 Using stern
 Using kubectx
 Using gnupg
 Using stacc-next
 Using visual-studio-code
 Using 1password
 Using 1password-cli
 Using postman
 Using slack

 Homebrew Bundle complete! 23 Brewfile dependencies now installed.

 🧩 Install suggested VSCode extentions? [Y/N] y
  ✔ copilot
  ✔ copilot-chat
  ✔ gitblame
  ✔ gitlens
  ✔ vscode-pull-request-github
  ✔ vscode-conventional-commits
  ✔ vscode-eslint
  ✔ vscode-styled-components
  ✔ vscode-kubernetes-tools
  ✔ vscode-base64
  ✔ vscode-yaml
  ✔ vscode-xml
  ✔ vscode-commons
  ✔ vscode-todo-highlight
  ✔ vscode-stylelint
  ✔ vscode-import-cost
  ✔ vscodeintellicode
  ✔ code-spell-checker
  ✔ nbsp-vscode
  ✔ postman-for-vscode
  ✔ markdown-preview-enhanced
  ✔ intellicode-api-usage-examples
  ✔ pdf

🔑 Configuring GPG
  gpg-agent[691337]: gpg-agent running and available
```

## FAQ
Frequently asked questions / common issues

### brew: command not found
If you get the folowing message from the installation script. 
```
🍻 Run 'Brew bundle'?[Y/N] y
install.sh: line 131: brew: command not found
```

Run this command in your terminal to add Homebrew to your PATH:
`eval "$(/opt/homebrew/bin/brew shellenv)"`

## Misc. Setup

### ⌘ + K
Allowing ⌘ + K to clear the integrated terminal in VSCode is essential for me.

```json
[
  {
    "key": "cmd+k",
    "command": "workbench.action.terminal.clear",
    "when": "terminalFocus && terminalProcessSupported"
  }
]
```

