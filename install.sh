#!/bin/bash


echo "Beginning setting up Dotfiles..."
sudo apt update && sudo apt install -y fzf tmux ripgrep fish

# Install nivm
wget -O $HOME/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod 755 $HOME/nvim.appimage
sudo $HOME/nvim.appimage --appimage-extract
sudo mv ./squashfs-root $HOME/nvim
sudo ln $HOME/nvim/usr/bin/nvim /usr/bin/nvim

# Install hx
wget -O $HOME/helix.appimage https://github.com/helix-editor/helix/releases/download/24.07/helix-24.07-x86_64.AppImage
chmod 755 $HOME/helix.appimage
sudo $HOME/helix.appimage --appimage-extract
sudo mv ./squashfs-root $HOME/helix
sudo ln $HOME/helix/usr/bin/hx /usr/bin/hx

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y
# Symlink various dotfiles to home directory
export DOTFILES=/workspaces/.codespaces/.persistedshare/dotfiles

# Tmuxifier
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

mkdir -p $HOME/.config/nvim
ln -sf $DOTFILES/init.lua $HOME/.config/nvim/init.lua

mkdir -p $HOME/.config/helix
cp -r $HOME/helix/usr/lib/helix/runtime/ $HOME/.config/helix/runtime
ln -sf $DOTFILES/helix.config.toml $HOME/.config/helix/config.toml

ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

ln -sf $DOTFILES/starship.toml $HOME/.config/starship.toml

mkdir -p $HOME/.config/fish
ln -sf $DOTFILES/config.fish $HOME/.config/fish/config.fish

# Set fish as the default shell
sudo chsh "$(id -un)" --shell "/usr/bin/fish"
ln -sf $DOTFILES/config.fish $HOME/.config/fish/config.fish

# Copy tmuxifier layout
cp $DOTFILES/work.session.sh $HOME/.tmuxifier/layouts/work.session.sh

# Fish setup
/usr/bin/fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
/usr/bin/fish -c "fisher install jorgebucaran/nvm.fish"

echo "Done setting up Dotfiles!"
