#!/bin/bash

echo "🚀 Setting up dotfiles using Stow..."

# Ensure Stow is installed, exit if not found
if ! command -v stow &>/dev/null; then
    echo "❌ GNU Stow is not installed. Installing via Homebrew..."
    exit 1
fi

# Set dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Ensure the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "❌ Directory $DOTFILES_DIR does not exist! Creating new directory ..."
    mkdir -p "$DOTFILES_DIR"
fi

# Backup directory (timestamped)
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# List of dotfiles to symlink
FILES=(".zshrc" ".p10k.zsh")

# Backup and symlink individual files
for file in "${FILES[@]}"; do
    if [ -e "$HOME/$file" ]; then
        echo "📦 Backing up $file to $BACKUP_DIR..."
        mv -v "$HOME/$file" "$BACKUP_DIR/"
    fi
    echo "🔗 Symlinking $file..."
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Symlink VS Code settings
if [ -d "$HOME/.vscode" ]; then
    echo "📦 Backing up .vscode to $BACKUP_DIR..."
    mv -v "$HOME/.vscode" "$BACKUP_DIR/"
fi
echo "🔗 Symlinking .vscode..."
ln -sfn "$DOTFILES_DIR/.vscode" "$HOME/.vscode"

# Symlink config directory
if [ -d "$HOME/.config" ]; then
    echo "📦 Backing up .config to $BACKUP_DIR..."
    mv -v "$HOME/.config" "$BACKUP_DIR/"
fi
echo "🔗 Symlinking .config..."
ln -sfn "$DOTFILES_DIR/.config" "$HOME/.config"

echo "✅ Dotfiles setup complete!"