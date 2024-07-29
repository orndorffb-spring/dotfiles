#!/bin/bash


echo "Beginning setting up Dotfiles..."
# Update package list and install zsh and neovim
sudo apt update && sudo apt install -y zsh nodejs npm fzf tmux ripgrep fish

# Install specific version of neovim
# I'm using v0.9.5
wget -O $HOME/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod 755 $HOME/nvim.appimage
sudo $HOME/nvim.appimage --appimage-extract
sudo mv ./squashfs-root $HOME/nvim
sudo ln $HOME/nvim/usr/bin/nvim /usr/bin/nvim



# Symlink various dotfiles to home directory
export DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles

ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf


## Neovim configuration setup
mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES/init.lua $HOME/.config/nvim/init.lua

ln -sf $DOTFILES/.starship.toml $HOME/.config/starship.toml
ln -sf $DOTFILES/.config.fish $HOME/.config/fish/config.fish

echo "export VIMRUNTIME=$HOME/nvim/usr/share/nvim/runtime" >> ~/.zshrc

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Set zsh as the default shell
sudo chsh "$(id -un)" --shell "/usr/bin/fish"

echo "Done setting up Dotfiles!
