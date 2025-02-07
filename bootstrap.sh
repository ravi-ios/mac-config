#!/bin/bash

echo "🚀 Starting Setup..."

# ===========================
# .zshrc
# ===========================
if [ ! -f ~/.zshrc ]; then
    echo "📄 Creating ~/.zshrc..."
    touch ~/.zshrc
else
    echo "✅ ~/.zshrc already exists!"
fi

# ===========================
# .zprofile
# ===========================
if [ ! -f ~/.zprofile ]; then
    echo "📄 Creating ~/.zprofile..."
    touch ~/.zprofile
else
    echo "✅ ~/.zprofile already exists!"
fi

# ===========================
# Install Homebrew
# ===========================
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed!"
fi

# Add Homebrew to PATH
if ! grep -q '/opt/homebrew/bin' ~/.zprofile; then
    echo "🔧 Updating PATH for Homebrew..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew doctor

# ===========================
# Install Brew packages
# ===========================

echo "🚀 Installing Brew Packages from Brewfile..."

# Ensure Brewfile exists
if [ ! -f "Brewfile" ]; then
    echo "❌ Brewfile not found!"
    exit 1
fi

# Install all packages using Brewfile
brew bundle --file=Brewfile --no-lock --verbose --force

echo "✅ All packages from Brewfile installed/updated! \n"

# ===========================
# Configure shell
# ===========================

# Ensure shell.sh is executed first
if [ ! -f "./shell.sh" ]; then
    echo "❌ shell.sh not found! Please place this script in the correct directory."
    exit 1
fi

# Execute home-brew.sh
chmod +x shell.sh
./shell.sh

# ===========================
# Configure macOS defaults
# ===========================

if [ ! -f "./macos_defaults.sh" ]; then
    echo "❌ macos_defaults.sh not found! Please place this script in the correct directory."
    exit 1
fi

# Execute home-brew.sh
chmod +x macos_defaults.sh
./macos_defaults.sh
