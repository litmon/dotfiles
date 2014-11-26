#!/bin/sh

# bash settings 
ln -s dots/bashrc ~/.bashrc
ln -s dots/bash_profile ~/.bash_profile
## scripts
ln -s git-scripts/git-completion.bash ~/.git-completion.bash
ln -s git-scripts/git-prompt.sh ~/.git-prompt.sh

# vim settings
ln -s dots/vimrc ~/.vimrc
ln -s vim-colors/moncolor.vim ~/.vim/colors/moncolor.vim

# git settings
ln -s dots/gitignore ~/.gitignore_global
ln -s dots/gitconfig ~/.gitconfig

# ag settings
ln -s dots/agignore ~/.agignore

# gem settings
ln -s dots/gemrc ~/.gemrc
