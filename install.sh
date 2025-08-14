#!/usr/bin/env bash

# Get the os parameter, if not provided, ask for it (macos or arch)
if [ -z "$1" ]; then
  echo "Please provide the OS type (macos or arch)."
  echo "Usage: $0 <os_type>"
  exit 1
fi

OS_TYPE="$1"

if [ "$OS_TYPE" != "macos" ] && [ "$OS_TYPE" != "arch" ]; then
  echo "Invalid OS type. Please use 'macos' or 'arch'."
  exit 1
fi

# Current path
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/phpactor"
mkdir -p "$HOME/.config/yazi"
mkdir -p "$HOME/.config/karabiner"
mkdir -p "$HOME/.config/wezterm"

# ZSH
ln -sf $DOTFILES/.zshrc $HOME/.zshrc

# Only for macOS
if [ "$OS_TYPE" = "macos" ]; then
    # Fira Code Nerd Font
    brew install font-fira-code-nerd-font
fi

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Phpactor
rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

if [ "$OS_TYPE" = "macos" ]; then
    brew install watchman
else
    sudo apt install -y watchman
fi

# Lazygit config linking
if [ "$OS_TYPE" = "macos" ]; then
    mkdir -p "$HOME/Library/Application Support/lazygit"
    ln -sf "$DOTFILES/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
else
    mkdir -p "$HOME/.config/lazygit"
    ln -sf "$DOTFILES/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
fi

# # Yazi
if [ "$OS_TYPE" = "macos" ]; then
    # Yazi for macOS
    brew install yazi
else
    sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
fi
rm -rf $HOME/.config/yazi
ln -s $DOTFILES/yazi $HOME/.config/yazi

# Karabiner
rm -rf $HOME/.config/karabiner
ln -s $DOTFILES/karabiner $HOME/.config/karabiner

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Wezterm
rm -rf $HOME/.config/wezterm
ln -s $DOTFILES/wezterm $HOME/.config/wezterm
