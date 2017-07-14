#!/usr/bin/env bash

function core() {
  echo -e "\nInstalling core brew packages..."
  echo      "================================"
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
  brew cask install suspicious-package
  brew cask install caffeine
  brew cask install flux
  brew cask install grandperspective
  brew cask install caskroom/fonts/font-hack
}

function extra() {
  echo -e "\nInstalling exta brew packages..."
  echo     "================================"
  brew cask install google-chrome
  brew cask install firefox
  brew cask install vlc
  brew cask install coconutbattery
  brew cask install hermes
  brew cask install createuserpkg
  brew cask install nvalt
  brew cask install cakebrew
  brew cask install endurance
  brew cask install itsycal
  brew cask install slack
  brew install youtube-dl
}

function dev() {
  echo -e "\nInstalling dev brew packages..."
  echo      "================================"
  brew cask install sublime-text
  brew cask install atom
  brew cask install sourcetree
  brew cask install macdown
  brew install cookiecutter
}

function dev-extra() {
  echo -e "\nInstalling dev-exta brew packages..."
  echo     "================================"
  brew install packer
  brew cask install vagrant
  brew cast install vmware-fusion
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
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return
  else
    exit
  fi

  init
}

# main
if [[ "$1" =~ ^(-{0,2})a(l{0,2})$ ]]; then
  confirm "all packages"
	core
  extra
  dev
  dev-exta
elif [[ "$1" =~ ^(-{0,2})e(xtra)?$ ]]; then
  confirm "the extra packages"
  extra
elif [[ "$1" =~ ^(-{0,2})d(ev)?$ ]]; then
  confirm "the dev packages"
  dev
elif [[ "$1" =~ ^(-{0,2})(D|dev-extra)$ ]]; then
  confirm "the dev-extra packages"
  dev-extra
elif [[ "$1" =~ ^(-{0,2})c(ore)?$ ]]; then
  confirm "the core packages"
  core
else
  echo "Usage: brew.sh group
group is one of:
  -c, --core         core packages
  -e, --extra        extra core packages
  -d, --dev          dev packages
  -D, --dev-extra    extra dev packages
  -a, --all          all packages"
fi
