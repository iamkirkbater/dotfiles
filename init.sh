#!/bin/bash
 
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/.tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux.conf.local $HOME/.tmux.conf.local
ln -sf $(pwd)/.vim $HOME/.vim
ln -sf $(pwd)/.vimrc $HOME/.vimrc

vim +PluginInstall +qall
