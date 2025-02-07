#!/bin/bash

echo "🚀 Applying macOS Customizations...\n"

# ===========================
# Finder Customizations
# ===========================

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show full path in Finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Set default Finder view mode to Column View (Options: Nlsv, icnv, clmv, Flwv)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# ===========================
# Screenshot & Screen Recording
# ===========================

# Change screenshot save location to ~/Screenshots
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

# Change screenshot format to JPG (default is PNG)
defaults write com.apple.screencapture type jpg

# ===========================
# Safari & Web Browsing
# ===========================

# Show full website URL in Safari’s address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable Safari Developer Menu and Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Prevent macOS from creating .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# ===========================
# Trackpad
# ===========================

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# ===========================
# Apply Changes
# ===========================

# Restart necessary services to apply changes
killall Finder
killall Dock
killall SystemUIServer

echo "✅ macOS customizations applied! 🚀 Restart your system for all changes to take full effect."