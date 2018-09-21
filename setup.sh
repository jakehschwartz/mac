#!/bin/bash

# Install XCode
xcode-select --install

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install MAS and log in
brew install mas
mas signin --dialog jakehschwartz@gmail.com

# Load brew formulae/casks/mas apps
brew bundle

# Create ssh keys
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
ssh-keygen -t rsa -b 4096 -C "Me MyName (MyDevice) <me@mydomain.com>"

# Mac Defaults
defaults write com.apple.screencapture location ~/Pictures/Screenshots/; killall SystemUIServer
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Dotfiles
cp -a dotfiles/. $HOME/
