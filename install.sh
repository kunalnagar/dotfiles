#!/usr/bin/env bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/Documents/Code/dotfiles
DIR_DOTFILES_CONFIG=$DIR_DOTFILES/config

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
rm -rf ~/.bash_profile

ln -s $DIR_DOTFILES_CONFIG/.bash_profile $DIR_HOME
source $DIR_HOME/.bash_profile
