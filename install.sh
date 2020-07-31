#!/usr/bin/env bash

DIR_HOME=$HOME
DIR_DOTFILES=$DIR_HOME/Code/Personal/dotfiles
DIR_DOTFILES_CONFIG=$DIR_DOTFILES/config

xcode-select --install

cp $DIR_DOTFILES_CONFIG/.bash_profile $DIR_HOME
source $DIR_HOME/.bash_profile

cp $DIR_DOTFILES_CONFIG/.gitconfig $DIR_HOME
