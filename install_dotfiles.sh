#!/bin/bash
############################
# This script creates symlinks from the home directory dotfiles in ~/dotfiles
############################

dotfiles_dir=~/dotfiles/home
dotfiles_backup_dir=~/.dotfiles_backup

# create dotfiles_old in homedir
if [[ ! -d $dotfiles_backup_dir ]]; then
	mkdir -p $dotfiles_backup_dir
fi

# move any existing dotfiles in homedir to dotfiles.bak directory, then create symlinks 
for file in "${dotfiles_dir}/*"; do
	name=$(basename $file)
	# echo ~/.${name} $dotfiles_backup_dir
	if [[ -f ~/.${name} ]]; then
		mv ~/.${name} $dotfiles_backup_dir/${name}
	fi
    ln -s $file ~/.${name}
done
