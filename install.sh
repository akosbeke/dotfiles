#!/usr/bin/env sh

# Current path
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ZSH
ln -sf $DOTFILES/.zshrc $HOME/.zshrc

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Alacritty
ln -sf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml
