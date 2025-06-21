#!/bin/bash

echo "beginning installation"

echo "installing dependencies" 
sudo pacman -S rofi kitty picom i3blocks eww git unzip fastfetch nano htop vscodium cava feh blueman clipman thunar dunst make base-devel --needed --noconfirm

echo "creating configuration directories"
mkdir -p ~/.config/i3/
mkdir -p ~/.config/kitty/
mkdir -p ~/.config/rofi/
mkdir -p ~/.config/picom/
mkdir -p ~/.config/i3blocks/
mkdir -p ~/.config/eww/

echo "copying config files to target directories"
cp -rf config/i3/* ~/.config/i3/
cp -rf config/i3blocks/* ~/.config/i3blocks/
cp -rf config/kitty/* ~/.config/kitty/
cp -rf config/picom/* ~/.config/picom/
cp -rf config/rofi/* ~/.config/rofi/
cp -rf config/eww/* ~/.config/eww/

echo "downloading wallpapers"
mkdir -p ~/Pictures/
cd ~/Pictures/
git clone https://github.com/diinki/wallpapers.git

echo "installing the maple mono nl font"

mkdir -p ~/Downloads/
mkdir -p ~/.local/share/fonts
cd ~/Downloads/
curl -LO https://github.com/subframe7536/maple-font/releases/download/v7.3/MapleMonoNL-TTF.zip
unzip MapleMonoNL-TTF.zip -d MapleMonoNL-TTF
cp MapleMonoNL-TTF ~/.local/share/fonts/

echo "updating font cache"
fc-cache -fv

echo "installing i3lock-fancy"
#cd ~/Downloads/
#git clone https://github.com/meskarune/i3lock-fancy.git
#cd i3lock-fancy
#sudo make install

cd ~/Downloads/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S i3lock-fancy

