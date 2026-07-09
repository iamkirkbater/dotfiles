#!/bin/bash
 
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux.conf.local $HOME/.tmux.conf.local

ln -sf $(pwd)/config.ghostty $HOME/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty

## This function only symlinks specific config files
## which is useful when the program writes state to
## the config directory which might not be applicable
## and we only want to overwrite the specific config files
function partial_config_setup() {
  local partials_dir="config-partials"

  config_dirs=$(find $partials_dir/* -type d | sed 's/config-partials\///')
  config_files=$(find $partials_dir/* -type f | sed 's/config-partials\///')

  mkdir -p $HOME/.config

  for dir in $config_dirs; do
    mkdir -p $HOME/.config/$dir
  done

  for file in $config_files; do;
    ln -sf $(pwd)/config-partials/$file $HOME/.config/$file
  done
}

## This function symlinks the entire config directory
## for programs where the entire config directory should
## be tracked
function config_setup() {
  local config_dir="config"

  config_dirs=$(find $config_dir -type d -d 1)

  mkdir -p $HOME/.config

  for dir in $config_dirs; do
    ln -sf $(pwd)/$dir $HOME/.$dir
  done
}

partial_config_setup
config_setup
