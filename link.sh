#!/bin/sh

# ${0} の dirname を取得
dotfiles_dir=`dirname "${0}"`

# ${0} が 相対パスの場合は cd して pwd を取得
expr "${0}" : "/.*" > /dev/null || dotfiles_dir=`(cd "${dotfiles_dir}" && pwd)`

### TODO dots/以下のファイルをすべてホームディレクトリにシンボリックリンクを貼る
# bash settings 
ln -s $dotfiles_dir/dots/bashrc ~/.bashrc
ln -s $dotfiles_dir/dots/bash_profile ~/.bash_profile
## scripts
ln -s $dotfiles_dir/git-scripts/git-completion.bash ~/.git-completion.bash
ln -s $dotfiles_dir/git-scripts/git-prompt.sh ~/.git-prompt.sh

## input settings
ln -s $dotfiles_dir/dots/inputrc ~/.inputrc

# vim settings
ln -s $dotfiles_dir/dots/vimrc ~/.vimrc
ln -s $dotfiles_dir/vim-colors/moncolor.vim ~/.vim/colors/moncolor.vim

# git settings
ln -s $dotfiles_dir/dots/gitignore ~/.gitignore_global
ln -s $dotfiles_dir/dots/gitconfig ~/.gitconfig
ln -s $dotfiles_dir/git-scripts/git_diff_wrapper /usr/local/bin/git_diff_wrapper

# ag settings
ln -s $dotfiles_dir/dots/agignore ~/.agignore

# gem settings
ln -s $dotfiles_dir/dots/gemrc ~/.gemrc
