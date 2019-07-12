#!/bin/bash
 
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -sf $HOME/dotfiles/.tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.tmux.conf.local $HOME/.tmux.conf.local
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc

vim +PluginInstall +qall
