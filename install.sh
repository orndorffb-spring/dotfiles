#!/bin/bash


echo "Beginning setting up Dotfiles..."
# Update package list and install zsh and neovim
sudo apt update && sudo apt install -y zsh fzf tmux neovim

# Symlink various dotfiles to home directory
export DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf


## Neovim configuration setup
mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES/init.lua $HOME/.config/nvim/init.lua

echo "Done setting up Dotfiles!
