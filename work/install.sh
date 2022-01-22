#!/bin/bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/.dotfiles

CURRENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Switch to bash
chsh -s /bin/bash

# XCode Tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install nvm and latest node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

# Git bash completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash

# Remove the generated bash_profile
rm -rf ~/.bash_profile

# Symlink .bash_profile and reload it
ln -s $DIR_DOTFILES_CONFIG/.bash_profile $DIR_HOME
source $DIR_HOME/.bash_profile

# Symlink profile picture
ln -s $DIR_DOTFILES/work/me.jpg ~/Pictures

# Symlink wallpaper
ln -s $DIR_DOTFILES/work/wallpaper.jpg ~/Pictures
ln -s $DIR_DOTFILES/work/wallpaper-flipped.jpg ~/Pictures

# Backup current Terminal Settings + Symlink custom config
mv ~/Library/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist.bak
ln -s $DIR_DOTFILES/work/com.apple.Terminal.plist ~/Library/Preferences

# brew install --cask bartender
# brew install --cask rectangle
# brew install --cask alfred
# brew install --cask google-chrome
# brew install --cask visual-studio-code
# brew install --cask zoom
# brew install --cask appcleaner
