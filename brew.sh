#!/usr/bin/env bash

# Install packages with Homebrew on OSX
# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

brew update

brew upgrade --all

brew install git
brew install heroku-toolbelt
brew install lynx
brew install nmap
brew install p7zip
brew install pigz
brew install python
brew install rsync
brew install tree
brew install vim --override-system-vi
brew install wget --with-iri
brew install zsh

brew tap caskroom/cask
brew cask install betterzipql
brew cask install google-chrome
brew cask install nvalt
brew cask install macdown
brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install spotify
brew cask install tunnelblick
brew cask install vlc

# Remove outdated versions from the cellar
brew cleanup
