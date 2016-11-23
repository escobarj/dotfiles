#!/usr/bin/env bash


# Install brew if needed
if ! [[ -f "/usr/local/bin/brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Misc binaries
brew install ssh-copy-id
brew install tree
brew install wget
brew install shellcheck
brew install youtube-dl

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

# for home computer
brew cask install microsoft-office
brew cask install virustotaluploader
brew cask install dropbox
brew cask install private-internet-access
brew cask install ripit
brew cask install handbrake
brew cask install atext
brew cask install airflow

# Brew python packages are handled in python.sh

brew linkapps

# Remove outdated versions from the cellar.
brew cleanup
