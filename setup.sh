#!/bin/bash

echo 'Make sure you are logged into the Mac App Store'

# Install XCode
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install MAS and log in
brew install mas

# Load brew formulae/casks/mas apps
brew bundle

sudo xcodebuild -license accept

# Create ssh keys
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
echo 'ssh-keygen -t rsa -b 4096 -C "'$USER'"'

# Mac Defaults
defaults write com.apple.screencapture location ~/Desktop/Screenshots/; killall SystemUIServer
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

# Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Dotfiles
cd dotfiles && for i in `ls `; do ln -s $PWD/$i ~/.$i; done && cd ..

mkdir ~/Dev

git config --global core.excludesfile ~/.gitignore_global

