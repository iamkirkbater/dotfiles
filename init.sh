#!/bin/bash
 
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux.conf.local $HOME/.tmux.conf.local
ln -sf $(pwd)/.vim $HOME/.vim
ln -sf $(pwd)/.vimrc $HOME/.vimrc

ln -sf $(pwd)/config.ghostty $HOME/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty

config_dirs=$(find config/* -type d)
config_files=$(find config/* -type f)

mkdir -p $HOME/.config

for dir in $config_dirs; do
  mkdir -p $HOME/.$dir
done

for file in $config_files; do
  ln -sf $(pwd)/$file $HOME/.$file
done

vim +PluginInstall +qall
