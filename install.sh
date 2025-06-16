#!/usr/bin/env bash
set -e
# install dependencies
echo "Installing dependencies..."
sudo dnf install -y kitty rofi feh git curl unzip i3lock xautolock dunst fastfetch lightdm lightdm-gtk htop picom make

echo "Installing i3 config and assets..."

# Copy configs
cp -r config/i3/* ~/.config/i3/
cp -r config/i3status/* ~/.config/i3status/
cp -r config/kitty/* ~/.config/kitty/
cp -r config/rofi/* ~/.config/rofi/
cp -r config/Xresources/.Xresources ~/.Xresources
sudo cp config/lightdm/* /etc/lightdm/
cp config/picom/* ~/.config/picom/


# Copy wallpapers
echo "Downloading wallpapers..."
cd  ~/Pictures/
git clone https://github.com/diinki/wallpapers.git
sudo cp ~/Pictures/wallpapers/may2025/STRAY_KITTY_CLUB-pink.png /usr/share/pixmaps/wallpaper.png

# Copy fonts
echo "Installing fonts..."
cd ~/Downloads/
curl -L -o MapleMonoNL-TTF.zip https://github.com/subframe7536/maple-font/releases/download/v7.3/MapleMonoNL-TTF.zip
unzip MapleMonoNL-TTF.zip -d MapleMonoNL-TTF
mv MapleMonoNL-TTF  ~/.local/share/fonts

# Refresh font cache
fc-cache -fv

# Merge Xresources
xrdb -merge ~/.Xresources

# Install lock screen script
echo "Installing lock screen script..."
cd ~/Downloads/
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

# Install and setup login manager lightdm
echo "Installing and configuring LightDM..."
sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service



echo "Initializing cleanup..."
# Cleanup
rm -rf ~/Downloads/MapleMonoNL-TTF.zip
rm -rf ~/Downloads/MapleMonoNL-TTF
rm -rf ~/Downloads/i3lock-fancy

echo "Installation complete! Reload i3 to apply changes."

while true; do
    read -rp "Do you want to reboot now to apply all changes? (y/n): " yn
    case $yn in
        [Yy]* )
            echo "Rebooting..."
            sudo reboot
            break
            ;;
        [Nn]* )
            echo "Reboot canceled. Remember to reboot later for all changes to take effect."
            break
            ;;
        * )
            echo "Please answer y (yes) or n (no)."
            ;;
    esac
done
