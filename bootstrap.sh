#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  # Create a copy of dotfile so we can rename the _. files
  if [[ -e tmp ]]; then
    rm -Rf tmp
  fi
  mkdir tmp
  rsync --exclude ".DS_Store" -avh --no-perms ./dotfiles/ ./tmp

  # Rename _. to .
  find tmp -name '_.*' -print0 | xargs -0 -I x sh -c 'file="x"; mv $file ${file//_./.}'

  # sync files to home folder
  rsync --exclude ".DS_Store" -avh --no-perms ./tmp/ ~/

  rm -rf tmp
  source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
