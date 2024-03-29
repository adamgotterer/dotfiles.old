#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
#brew install bash-completion

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install brew recipes
brew install vim
brew install git
brew install ack
brew install brew-cask
brew install cscope
brew install gdbm
brew install macvim
brew install pcre
brew install readline
brew install zsh
brew install bash-completion
brew install tmux
brew install reattach-to-user-namespace # copy paste to mac from tmux
brew install pgcli
brew install httpie
brew install rbenv
brew install ruby-build
brew install hub
brew install fpp
brew install neovim/neovim/neovim
brew install tree
brew install ngrok
brew install ctags
brew install exa
brew install fzf # Required for tmux laktak/extrakto
brew install fd
brew install pipenv
brew install gnupg2

# Install diff so fancy
brew install node
brew install gnu-sed --with-default-names
npm install -g diff-so-fancy

# Remove outdated versions from the cellar.
brew cleanup

# Setup ctags for rbenv
mkdir -p ~/.rbenv/plugins
git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
rbenv ctags
