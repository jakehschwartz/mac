#!/bin/bash

echo 'Make sure you are logged into the Mac App Store':xa

# Install XCode
xcode-select --install

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install MAS and log in
brew install mas

# Load brew formulae/casks/mas apps
brew cask install adoptopenjdk
brew bundle

sudo xcodebuild -license accept

# Create ssh keys
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
echo 'ssh-keygen -t rsa -b 4096 -C "'$USER'"'

# Mac Defaults
defaults write com.apple.screencapture location ~/Pictures/Screenshots/; killall SystemUIServer
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Dotfiles
cp -a dotfiles/. $HOME/

mkdir ~/Dev
