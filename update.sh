echo "Updating repositories..."
git pull origin main 
 
 echo "Updating system packages..."
 
 sudo dnf install -y kitty rofi feh git curl unzip i3lock xautolock dunst fastfetch lightdm lightdm-gtk htop picom make pip spotdl ffmpeg firefox 


 echo "Updating configs"
cp -r config/i3/* ~/.config/i3/
cp -r config/i3status/* ~/.config/i3status/
cp -r config/kitty/* ~/.config/kitty/
cp -r config/rofi/* ~/.config/rofi/
cp -r config/Xresources/ ~/.Xresources
sudo cp config/lightdm/* /etc/lightdm/
cp config/picom/* ~/.config/picom/


echo "All done! Reload i3 to apply changes."
