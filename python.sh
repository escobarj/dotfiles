#!/usr/bin/env bash

# This may require sudo, I haven't tried it yet
# Ask for the administrator password upfront
# sudo -v

# Install pip
easy_install pip

# Update pip
pip install pip --upgrade

# Install useful modules
pip virtualenv

# Install python3

if ! [[ -f "/usr/local/bin/brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install python3
brew linkapps