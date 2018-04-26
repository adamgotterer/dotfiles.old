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
brew tap caskroom/fonts

# Install applications
brew cask install adium
brew cask install appcleaner
brew cask install chefdk
brew cask install divvy
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install java
brew cask install qlstephen
brew cask install spotify
brew cask install the-unarchiver
brew cask install utorrent
brew cask install vagrant
brew cask install virtualbox
brew cask install 1password
brew cask install stay
brew cask install macdown
brew cask install font-dejavu-sans-mono-for-powerline # Powerline font
brew cask install sublime-text

# Remove outdated versions from the cellar.
brew cleanup

