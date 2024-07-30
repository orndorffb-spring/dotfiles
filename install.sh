#!/bin/bash


echo "Beginning setting up Dotfiles..."
# Update package list and install zsh and neovim
sudo apt update && sudo apt install -y zsh nodejs npm fzf tmux ripgrep fish helix

# Install specific version of neovim
# I'm using v0.9.5
wget -O $HOME/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod 755 $HOME/nvim.appimage
sudo $HOME/nvim.appimage --appimage-extract
sudo mv ./squashfs-root $HOME/nvim
sudo ln $HOME/nvim/usr/bin/nvim /usr/bin/nvim

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Symlink various dotfiles to home directory
export DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles

mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES/init.lua $HOME/.config/nvim/init.lua
mkdir -p $HOME/.config/helix
ln -sf $DOTFILES/healix.config.toml $HOME/.config/helix/config.toml
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/starship.toml $HOME/.config/starship.toml
mkdir -p $HOME/.config/fish
ln -sf $DOTFILES/config.fish $HOME/.config/fish/config.fish

# Set fish as the default shell
sudo chsh "$(id -un)" --shell "/usr/bin/fish"
ln -sf $DOTFILES/config.fish $HOME/.config/fish/config.fish

echo "Done setting up Dotfiles!"
