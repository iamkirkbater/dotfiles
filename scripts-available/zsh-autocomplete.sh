#!/bin/bash

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
