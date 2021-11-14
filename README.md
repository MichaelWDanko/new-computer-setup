# new-computer-setup
A project of things that need to be setup to help configure a new computer

## Using ZSH in Terminal

### Installing Oh My ZSH
1. `cd ~`
2. `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Theme
1. File is `.zshrc` located in `~/`
- `ZSH_THEME="gallois"`

---
## Setting Up Git
*XCode is required to be installed before the additional files for Git can be installed. Checking for git can be done with `git --version`.
1
### Setting Global Username & Email
- `git config --global user.name "MichaelWDanko"`
- `git config --global user.email "michaeldanko@icloud.com"`

### Using Nano editor for Git commits
- `git config --global core.editor "nano"`

### Setting up a global  `.gitignore`
1. `touch ~/.gitignore_global`
2. `open ~/.gitignore_global`
3. `git config --global core.excludesfile ~/.gitignore_global`

#### Sample .gitignore global file
```
# OS generated files #
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs and databases #
*.log
*.sql
*.sqlite

# Swift Playgrounds
timeline.xctimeline
playground.xcworkspace

# Xcode user settings
xcuserdata/
```
---

## Redirect Downloads folder to iCloud
1. Delete the existing `Downloads` folder using `sudo rm -r ~/Downloads`
2. Open a Finder window for the parent folder of the icloud download folder
3. Drag the `Downloads` folder to a Terminal window to get the properly escaped path
4. Create a new redirect using the following command but verify that the path for the iCloud folder is correct `sudo ln -s /Users/michaeldanko/Library/Mobile\ Documents/com\~apple\~CloudDocs/Downloads ~/Downloads`