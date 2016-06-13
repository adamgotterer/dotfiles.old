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

brew cask install crashplan
brew cask install jdownloader2
brew cask install plex-media-server
brew cask install vlc
brew cask install steam

# Remove outdated versions from the cellar.
brew cleanup


