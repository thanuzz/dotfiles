#!/bin/bash
# macOS preferences and system settings

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=%00

# Set the default screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Show the full path in the title bar of Finder
defaults write com.apple.finder ShowPathbar -bool true

# Set Dock preferences
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock show-recents -bool false

# Restart Dock and Finder to apply changes
killall Dock
killall Finder
