#!/usr/bin/env sh

# Get the os parameter, if not provided, ask for it (macos or debian)
if [ -z "$1" ]; then
  echo "Please provide the OS type (macos or debian)."
  echo "Usage: $0 <os_type>"
  exit 1
fi

OS_TYPE="$1"

if [ "$OS_TYPE" != "macos" ] && [ "$OS_TYPE" != "debian" ]; then
  echo "Invalid OS type. Please use 'macos' or 'debian'."
  exit 1
fi

# Current path
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
    apt install -y watchman
fi

# Lazygit
ln -s $HOME/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml 

# Yazi
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
