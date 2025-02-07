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

# Restart System UI to apply changes
killall SystemUIServer

# ===========================
# Safari & Web Browsing
# ===========================

# Show full website URL in Safari’s address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable Safari Developer Menu and Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# ===========================
# System Tweaks
# ===========================

# Expand Save and Print Dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable macOS Gatekeeper (allow all apps to run)
sudo spctl --master-disable

# Prevent macOS from creating .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable "Are you sure you want to open this app?" warning
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ===========================
# Trackpad
# ===========================

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# ===========================
# Terminal
# ===========================

# Set Terminal to use UTF-8 encoding
defaults write com.apple.terminal StringEncodings -array 4

# ===========================
# Power & Battery
# ===========================

# Prevent macOS from sleeping when the display is off
sudo pmset -a displaysleep 0

# Show battery percentage in menu bar
# Not working on latest OS
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# ===========================
# Apply Changes
# ===========================

# Restart necessary services to apply changes
killall Finder
killall Dock
killall SystemUIServer

echo "✅ macOS customizations applied! 🚀 Restart your system for all changes to take full effect."