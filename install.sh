#!/bin/bash

# Update package list and install zsh and neovim
sudo apt update && sudo apt install -y neovim

export DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles

mkdir -p $HOMR/.config/nvim
ln -sf $DOTFILES/.vimrc $HOME/.config/nvim/init.lua
