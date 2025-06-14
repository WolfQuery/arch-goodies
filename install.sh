#!/usr/bin/env bash
set -e

echo "Installing i3 config and assets..."

# Create config directories
mkdir -p ~/.config/i3
mkdir -p ~/.config/kitty
mkdir -p ~/.local/share/fonts
mkdir -p ~/Pictures/wallpapers

# Copy configs
cp -r config/i3/* ~/.config/i3/
cp -r config/kitty/* ~/.config/kitty/
cp config/Xresources ~/.Xresources

# Copy wallpapers
cp -r config/wallpapers/* ~/Pictures/wallpapers/

# Copy fonts
cp -r config/fonts/* ~/.local/share/fonts/

# Refresh font cache
fc-cache -fv

# Merge Xresources
xrdb -merge ~/.Xresources

echo "Installation complete! Reload i3 to apply changes."

