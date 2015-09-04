#!/usr/bin/env bash

# Install applications through brew-cask

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Add some taps
brew tap caskroom/cask
brew tap caskroom/versions
brew tap thoughtbot/formulae

# Install applications
brew cask install --appdir="/Applications" adium
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" chefdk
brew cask install --appdir="/Applications" divvy
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" qlstephen
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" utorrent
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" dockertoolbox

# Remove outdated versions from the cellar.
brew cleanup

