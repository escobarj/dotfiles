#!/usr/bin/env bash

function core() {
  echo "\nInstalling core brew packages..."
  echo   "================================"
  # Command line packages
  brew install ssh-copy-id
  brew install tree
  brew install wget
  brew install shellcheck
  brew install thefuck
  brew install csshx
  brew install bash-completion
  brew install homebrew/completions/vagrant-completion
  brew install git bash-completion

  # Quick Look plugins
  brew cask install qlcolorcode
  brew cask install qlstephen
  brew cask install qlmarkdown
  brew cask install quicklook-json
  brew cask install quicklook-csv
  brew cask install betterzipql

  # GUI applications
  brew cask install google-chrome
  brew cask install firefox
  brew cask install suspicious-package
  brew cask install caffeine
  brew cask install flux
  brew cask install grandperspective
  brew cask install caskroom/fonts/font-hack
}

function extra() {
  echo "\nInstalling exta brew packages..."
  echo   "================================"
  brew cask install vlc
  brew cask install coconutbattery
  brew cask install hermes
  brew install youtube-dl
}

function dev() {
  echo "\nInstalling dev brew packages..."
  echo   "================================"
  brew cask install sublime-text
  brew cask install atom
  brew cask install sourcetree
  brew cask install macdown
  brew install cookiecutter
}

function dev-extra() {
  echo "\nInstalling dev-exta brew packages..."
  echo   "================================"
  brew install packer
  brew cask install vagrant
  brew cask install pycharm
  brew cask install mysqlworkbench
  brew cask install sequel-pro
  brew cask install mysql-connector-python
  brew cask install sqlitebrowser
  brew cask install platypus
}

function cleanup() {
  brew upgrade
  brew linkapps
  brew cleanup
}

function init() {
  if test ! $(which brew); then
      echo "Installing homebrew"
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew tap caskroom/cask
  brew update
}

function confirm() {
  read -p "Are you sure you want to install $1? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
  fi

  init
}

# main
if [[ "$1" == "--all" ]] || [[ "$1" == "-a" ]] || [[ "$1" == "a" ]]; then
  confirm "all brew packages"
	core
  extra
  dev
  dev-exta
elif [[ "$1" == "--extra" ]] || [[ "$1" == "-e" ]] || [[ "$1" == "e" ]]; then
  confirm "core and extra"
  core
  extra
elif [[ "$1" == "--dev" ]] || [[ "$1" == "-d" ]] || [[ "$1" == "d" ]]; then
  confirm "dev"
  dev
elif [[ "$1" == "--dev-extra" ]] || [[ "$1" == "-D" ]] || [[ "$1" == "D" ]]; then
  confirm "dev and dev-extra"
  dev
  dev-extra
else
  confirm "core"
  core
fi
