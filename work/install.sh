#!/bin/bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/.dotfiles

# Switch to bash
# chsh -s /bin/bash

# XCode Tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
brew update

# Install latest bash and configure it
brew install bash
sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"
chsh -s /usr/local/bin/bash

## Install nvm and latest node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

# Git bash completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash

# Remove the generated bash_profile
rm -rf ~/.bash_profile

# Symlink .bash_profile and reload it
ln -s $DIR_DOTFILES/config/.bash_profile $DIR_HOME
source $DIR_HOME/.bash_profile
# DEBUG
cat ~/.bash_profile

# Symlink profile picture
ln -s $DIR_DOTFILES/work/me.jpg ~/Pictures

# Symlink wallpaper
ln -s $DIR_DOTFILES/work/wallpaper.jpg ~/Pictures
ln -s $DIR_DOTFILES/work/wallpaper-flipped.jpg ~/Pictures
# DEBUG
ls -al ~/Pictures

# Backup current Terminal Settings + Symlink custom config
mv ~/Library/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist.bak
ln -s $DIR_DOTFILES/work/com.apple.Terminal.plist ~/Library/Preferences
# DEBUG
cat ~/Library/Preferences/com.apple.Terminal.plist

brew install --cask bartender
brew install --cask rectangle
brew install --cask alfred
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask appcleaner

# Cleanup
brew cleanup

ls -al $DIR_HOME
