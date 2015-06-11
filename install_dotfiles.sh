#!/bin/bash
############################
# This script creates symlinks from the home directory dotfiles in ~/dotfiles
############################

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
dotfiles_dir="${CWD}/home"
dotfiles_backup_dir="${HOME}/.dotfiles_backup"

# Debug
# echo $dotfiles_dir
# echo $dotfiles_backup_dir
# exit

# create dotfiles_old in homedir
if [[ ! -d $dotfiles_backup_dir ]]; then
	mkdir -p $dotfiles_backup_dir
fi

# create a backup of existing dotfile and then create symlink to new dotfile 
for dfile in "${dotfiles_dir}/*"; do
		fname=$(basename $dfile)
		current_file="${HOME}/.${fname}"
		if [[ -f "$current_file" ]]; then
			echo "Backing up" $current_file
			cp "$current_file" "${dotfiles_backup_dir}/${fname}_$(date "+%Y.%m.%d-%H.%M.%S")"
			rm $current_file
		fi
		echo "Linking" $dfile
	    ln -s $dfile "$current_file"
done
