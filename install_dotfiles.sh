#!/bin/bash
############################
# This script creates symlinks from the home directory dotfiles in ~/dotfiles
############################

dotfiles_dir="~/dotfiles/home"                    # dotfiles directory
dotfiles_backup_dir="~/.dotfiles_backup"             # old dotfiles backup directory

# create dotfiles_old in homedir
mkdir -p $dotfiles_backup_dir

# move any existing dotfiles in homedir to dotfiles.bak directory, then create symlinks 
for file in "${dotfiles_dir}/*"; do
	if [[ -f ~/.$file ]]; then
		mv ~/.$file $dotfiles_backup_dir
	fi
    ln -s $dotfiles_dir/$file ~/.$file
done
