#!/bin/bash

# This assumes powerlevel10k is already installed via brew.

echo "🚀 Starting Shell Setup..."

# ===========================
# Configure Zsh & Plugins
# ===========================
echo "⚙️ Configuring Zsh..."

# Add Powerlevel10k to .zshrc
if ! grep -q "powerlevel10k/powerlevel10k.zsh-theme" ~/.zshrc; then
    echo "🖌️ Setting up Powerlevel10k..."
    echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
    echo '[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh' >> ~/.zshrc
fi

# Add Zsh plugins
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
    echo "💡 Adding Zsh plugins..."
    echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

# Add zoxide
if ! grep -q "zoxide init zsh" ~/.zshrc; then
    echo "🔄 Setting up Zoxide..."
    echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

# ===========================
# Reload Configurations
# ===========================
echo "♻️ Reloading Zsh configurations..."
source ~/.zshrc

echo "✅ Shell setup complete! 🚀 Restart your terminal to see the changes."
