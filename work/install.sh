#!/bin/bash

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

# Set a fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2

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

# Remove .bashrc
rm -rf $DIR_HOME/.bashrc

## Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Git bash completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash $DIR_HOME/.git-completion.bash

pwd
ls -al

# Switch the shell to bash and symlink the .bashrc
chsh -s $(which bash)
ln -s $DIR_DOTFILES/.bashrc $DIR_HOME
source $DIR_HOME/.bashrc

# Remove the generated .gitconfig, symlink ours and reload it
rm -rf $DIR_HOME/.gitconfig
ln -s $DIR_DOTFILES/.gitconfig $DIR_HOME
# DEBUG
cat $DIR_HOME/.gitconfig

# Install node LTS
nvm install --lts

# Symlink profile picture
ln -s $DIR_IMAGES/me.jpg ~/Pictures

# Symlink wallpaper
ln -s $DIR_IMAGES/wallpaper.jpg ~/Pictures
ln -s $DIR_IMAGES/wallpaper-flipped.jpg ~/Pictures
# DEBUG
ls -al ~/Pictures

# I use multiple monitors, so set the wallpapers on both desktops
osascript -e 'tell application "System Events" to set picture of current desktop to "${DIR_HOME}/Pictures/wallpaper-flipped.jpg" as POSIX file'
osascript -e 'tell application "System Events" to set picture of second desktop to "${DIR_HOME}/Pictures/wallpaper.jpg" as POSIX file'

# Backup current Terminal Settings + Symlink custom config
mv ~/Library/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist.bak
ln -s $DIR_MACOS/com.apple.Terminal.plist ~/Library/Preferences

# Apps
brew install --cask bartender
brew install --cask rectangle
brew install --cask alfred
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask appcleaner
brew install --cask docker

# Cleanup
brew cleanup

# List home directory
ls -al $DIR_HOME
