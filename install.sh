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

# AeroSpace
rm -rf $HOME/.config/aerospace
ln -s $DOTFILES/aerospace $HOME/.config/aerospace

# Borders
rm -rf $HOME/.config/borders
ln -s $DOTFILES/borders $HOME/.config/borders

# Karabiner
rm -rf $HOME/.config/karabiner
ln -s $DOTFILES/karabiner $HOME/.config/karabiner

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Tmux Powerline
rm -rf $HOME/.config/tmux-powerline
ln -s $DOTFILES/tmux-powerline $HOME/.config/tmux-powerline

# Alacritty
ln -sf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml

# Kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# Wezterm
rm -rf $HOME/.config/wezterm
ln -s $DOTFILES/wezterm $HOME/.config/wezterm
