#!/usr/bin/env bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/Code/Personal/dotfiles
DIR_DOTFILES_CONFIG=$DIR_DOTFILES/config

# Setup bash_profile
#
#   1. Download git-completion.bash and move it to ~/
#   2. Copy bash_profile to ~/
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash
cp $DIR_DOTFILES_CONFIG/.bash_profile $DIR_HOME
source $DIR_HOME/.bash_profile

cp $DIR_DOTFILES_CONFIG/.gitconfig $DIR_HOME
