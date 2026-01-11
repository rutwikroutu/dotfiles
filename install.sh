#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

echo "🔧 Installing dotfiles from $DOTFILES"

# Ensure base dirs exist
mkdir -p "$CONFIG"

# --- Neovim ---
if [[ ! -f "$DOTFILES/nvim/init.vim" && ! -f "$DOTFILES/nvim/init.lua" ]]; then
  echo "❌ Neovim config not found in $DOTFILES/nvim"
  exit 1
fi

ln -sfn "$DOTFILES/nvim" "$CONFIG/nvim"
echo "✅ Linked Neovim config"

# --- tmux ---
if [[ ! -f "$DOTFILES/tmux/.tmux.conf" ]]; then
  echo "❌ tmux config not found"
  exit 1
fi

ln -sfn "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "✅ Linked tmux config"

# --- tmuxinator ---
ln -sfn "$DOTFILES/tmuxinator" "$CONFIG/tmuxinator"
echo "✅ Linked tmuxinator config"

echo "🎉 Dotfiles installation complete"

