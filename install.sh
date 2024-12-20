#!/usr/bin/env sh

# Current path
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ZSH
ln -sf $DOTFILES/.zshrc $HOME/.zshrc

# Fira Code Nerd Font
brew install font-fira-code-nerd-font

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Phpactor
rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

brew install watchman

# Lazygit
ln -s $HOME/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml 

# AeroSpace
rm -rf $HOME/.config/aerospace
ln -s $DOTFILES/aerospace $HOME/.config/aerospace

# SketchyBar
rm -rf $HOME/.config/sketchybar
ln -s $DOTFILES/sketchybar $HOME/.config/sketchybar
chmod +x $HOME/.config/sketchybar/items/*
chmod +x $HOME/.config/sketchybar/plugins/*

# Borders
rm -rf $HOME/.config/borders
ln -s $DOTFILES/borders $HOME/.config/borders

# Yazi
rm -rf $HOME/.config/yazi
ln -s $DOTFILES/yazi $HOME/.config/yazi

# Karabiner
rm -rf $HOME/.config/karabiner
ln -s $DOTFILES/karabiner $HOME/.config/karabiner

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Alacritty
ln -sf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml

# Kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# Wezterm
rm -rf $HOME/.config/wezterm
ln -s $DOTFILES/wezterm $HOME/.config/wezterm
