#!/bin/bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/.dotfiles

# Install latest updates
sudo softwareupdate -i -a

# Set default Finder view as Column
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Set other Finder preferences
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Open Desktop when opening a new Finder window
defaults write com.apple.finder NewWindowTargetPath -string "PfDe"

# Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Restart Finder
killAll cfprefsd
killAll Finder

# Set a really fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# XCode Tools
xcode-select --install

# Disable automatic updates
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false

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
