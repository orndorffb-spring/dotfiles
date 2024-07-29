#!/bin/bash

# Update package list and install zsh and neovim
sudo apt update && sudo apt install -y zsh fzf tmux neovim

## Neovim configuration setup
mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES/init.vim $HOME/.config/nvim/init.vim

