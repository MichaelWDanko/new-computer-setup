# new-computer-setup
A project of things that need to be setup to help configure a new computer

---

## Showing hidden files on macOS
-`Command` + `Shift` + `.`

---

## Redirect Downloads folder to iCloud
1. Delete the existing `Downloads` folder using `sudo rm -r ~/Downloads`
2. Open a Finder window for the parent folder of the icloud download folder
3. Drag the `Downloads` folder to a Terminal window to get the properly escaped path
4. Create a new redirect using the following command but verify that the path for the iCloud folder is correct `sudo ln -s /Users/michaeldanko/Library/Mobile\ Documents/com\~apple\~CloudDocs/Downloads ~/Downloads`

---
## Setting up Brew & Installing Node
* Visit `https://brew.sh` to get the latest Brew version to install
* Add the Brew to your PATH value within the `.zshrc` file -> `:/opt/homebrew/bin/` where it's colon separated.
* * This previously worked by adding a new line at the bottom of the file `export PATH="/opt/homebrew/bin:$PATH"`
* Install Node using `brew install node`
* If you have made changes to your PATH file and it has not yet been recognized, you can use `source ~/.zshrc` to reload the configurations.
---
## Setting Up Git
* Checking for git can be done with `git --version`.

### Setting Global Username & Email
- `git config --global user.name "MichaelWDanko"`
- `git config --global user.email "michaeldanko@icloud.com"`

### Using Nano editor for Git commits
- `git config --global core.editor "nano"`

### Setup automatic remote branch
- `git config --global --add --bool push.autoSetupRemote true`

### Setting up a global  `.gitignore`
- `touch ~/.gitignore_global`
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
## Using ZSH in Terminal

### Installing Oh My ZSH
- `cd ~`
- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Theme
- File is `.zshrc` located in `~/`
- `ZSH_THEME="gallois"`

---

## SSH Keys

### Generate an SSH key and save it to the ssh-agent
[GitHub Documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Generate a new SSH key
- Create a new SSH key using the email below as a label.
- When prompted, confirm the default file position to save it. 
`ssh-keygen -t ed25519 -C "michaeldanko@icloud.com"`

### Adding SSH key to the ssh-agent
- Start the ssh-agent in the background
`eval "$(ssh-agent -s)"`

### Modify the SSH config
- Check to see if the config exists
- `open ~/.ssh/config`
- If the config doesn't exist, create it and then added the following content
- `touch ~/.ssh/config`

```
 Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

### Add SSH private to the ssh-agent
- `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`

### Add SSH public key to GitHub
- Navigate to the GitHub profile settings (https://github.com/settings/profile)
- Click to add a new SSH key and upload the contents of the **public** key that can be located in `~/.ssh`

---

## GPG Keys

### Check for existing GPG keys
- `gpg --list-secret-keys --keyid-format=long`
```
/Users/michaeldanko/.gnupg/pubring.kbx
--------------------------------------
sec   rsa4096/1843A5F930706B28 2022-07-16 [SC]
      AE7BD7C07AACF01098073E4C1843A5F930706B28
uid                 [ultimate] Michael Danko (MD - michaeldanko@icloud.com) <michaeldanko@icloud.com>
ssb   rsa4096/3A260E8B789BD1DA 2022-07-16 [E]
```

### Generate a GPG key and add it to GitHub
- Download the [GPG Suite](https://gpgtools.org) (will help prevent from having to enter GPG passphrase every time) 
- `gpg --full-generate-key`
- Continue with the prompts but choose a bit size of `4096`
- Provide the email of a verified email in github

### Use an existing GPG key for signing commits
- `gpg --armor --export <key_id>` (Would be `1843A5F930706B28` from example above)
- Copy and paste the entire public key starting with the section that is `-----BEGIN PGP PUBLIC KEY BLOCK-----` and also copy the same part that is `-----ENDS...`
- Paste this into GitHub

### Configure git with GPG
- `git config --global commit.gpgsign true`
- `git config --global user.signingkey <key_id>`

---
