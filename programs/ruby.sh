#!/usr/bin/env bash

# Install rvm to manage multiple ruby versions
curl -sSL https://get.rvm.io | bash -s stable --ruby

source ~/.bash_profile

rvm use 2.6.3

ruby -v

sudo gem update
sudo gem install bundler jekyll
