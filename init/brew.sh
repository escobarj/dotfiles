#!/usr/bin/env bash


# Install brew if needed
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

# Misc cli tools
brew install ssh-copy-id
brew install tree
brew install wget
brew install shellcheck
brew install youtube-dl
brew install bash-completion
brew install thefuck
brew install cookiecutter
brew install packer
brew install csshx

echo -e "\n\nInstalling homebrew cask apps..."
echo "=============================="

# Brew cask apps
brew tap caskroom/cask
brew cask install sublime-text
brew cask install atom
brew cask install pycharm
brew cask install sourcetree
brew cask install google-chrome
brew cask install firefox
brew cask install caffeine
brew cask install coconutbattery
brew cask install flux
brew cask install grandperspective
brew cask install hermes
brew cask install mysqlworkbench
brew cask install sequel-pro
brew cask install mysql-connector-python
brew cask install platypus
brew cask install sqlitebrowser
brew cask install vlc
brew cask install caskroom/fonts/font-hack
brew cask install vagrant

# Brew python packages are handled in python.sh

brew linkapps

# Remove outdated versions from the cellar.
brew cleanup
