cat > ~/dotfiles/install.sh <<'SH'
#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

link() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    echo "OK (already linked): $dst"
    return
  fi

  if [ -e "$dst" ]; then
    echo "Backing up existing $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

# Neovim
link "$DOTFILES/nvim" "$HOME/.config/nvim"

# tmux
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# tmuxinator: support both common paths
if [ -d "$DOTFILES/tmuxinator" ]; then
  # Prefer ~/.config/tmuxinator on Linux
  link "$DOTFILES/tmuxinator" "$HOME/.config/tmuxinator"
fi

echo "Done."
SH

chmod +x ~/dotfiles/install.sh

