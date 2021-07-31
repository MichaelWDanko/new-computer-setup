# git-env-setup
A project of things that need to be setup to help configure a new computer

## Using ZSH in Terminal
**Installing Oh My ZSH**
1. `cd ~`
2. `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

**Theme**
1. File is `.zshrc` located in `~/`
- `ZSH_THEME="gallois"`

## Using Nano editor for Git commits
- `git config --global core.editor "nano"`

## Setting up a global  `.gitignore`
1. `touch ~/.gitignore_global`
2. `open ~/.gitignore_global`
3. `git config --global core.excludesfile ~/.gitignore_global`