#!/usr/bin/env sh

# Current path
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ZSH
ln -sf $DOTFILES/.zshrc $HOME/.zshrc

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Yabai
rm -rf $HOME/.config/yabai
ln -s $DOTFILES/yabai $HOME/.config/yabai

# skhd
rm -rf $HOME/.config/skhd
ln -s $DOTFILES/skhd $HOME/.config/skhd

# Karabiner
rm -rf $HOME/.config/karabiner
ln -s $DOTFILES/karabiner $HOME/.config/karabiner

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Alacritty
ln -sf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml
