#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  src="$DOTFILES_DIR/$1"
  dest="$HOME/$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%s)"
  fi
  ln -sf "$src" "$dest"
  echo "→ $dest → $src"
}

link .zshrc .zshrc
link .aliases .aliases
link .gitconfig .gitconfig
link .gitignore_global .gitignore_global
link .editorconfig .editorconfig
link .config/starship.toml .config/starship.toml

if command -v zsh >/dev/null 2>&1; then
  chsh -s "$(command -v zsh)" || true
fi

echo "✅ dotfiles installed."
