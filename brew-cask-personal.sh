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

brew cask install --appdir="/Applications" crashplan
brew cask install --appdir="/Applications" jdownloader2
brew cask install --appdir="/Applications" plex-media-server
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" steam

# Remove outdated versions from the cellar.
brew cleanup


