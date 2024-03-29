#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=/home/luquoo/dotfiles                    # dotfiles directory
olddir=/home/luquoo/dotfiles_old             # old dotfiles backup directory
files="vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in home"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from home to $olddir"
    mv /home/luquoo/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file /home/luquoo/.$file
done
