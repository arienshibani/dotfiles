# The following file automatically downloads, and installs all the VSCode extensions listed.
# Requires an installation of vscode, as it relies on the "code" command. To run the script:
#
#  How to run the script:
#   0. Make sure VSCode is installed.
#   1. Download the file
#   2. Navigate to the files location.
#   3. Run "sh extensions.bash" 

# Markdownlint: Automatically refactor badly written documentation.
code --install-extension DavidAnson.vscode-markdownlint

# GHCopilot: Automatically write code.
code --install-extension GitHub.copilot

# ESLint: Automatically refactor badly written code.
code --install-extension dbaeumer.vscode-eslint

# GitLens: Visualize code authorship.
code --install-extension eamodio.gitlens 

# Docker: Manage containers.
code --install-extension ms-azuretools.vscode-docker  

# Kubernetes: Manage kubernetes clusters.
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

# Path Intellisense: Autocompletes relative file paths for local files.
code --install-extension christian-kohler.path-intellisense

# Import Cost: Visualize the cost of importing various packages.
code --install-extension wix.vscode-import-cost

# Python: Language support for python.
code --install-extension ms-python.python
