#!/bin/bash

# Fix default user icon
sudo cp /usr/share/lightdm-webkit/themes/Aether/src/img/default-user.png /var/lib/AccountsService/icons/$USER
sudo sed -i "s/Icon=\/home\/$USER\/.face/Icon=\/var\/lib\/AccountsService\/icons\/$USER/g" /var/lib/AccountsService/users/$USER

echo -e "\e[92m\e[1mFixed default user icon.\e[m"

# Change cursor
sed -i "s/Inherits=Adwaita/Inherits=macOSBigSur/g" $HOME/.icons/default/index.theme
sed -i "s/gtk-cursor-theme-name=\"Adwaita\"/gtk-cursor-theme-name=\"macOSBigSur\"/g" $HOME/.gtkrc-2.0
sed -i "s/gtk-cursor-theme-name=\"Adwaita\"/gtk-cursor-theme-name=\"macOSBigSur\"/g" $HOME/.config/gtk-3.0/settings.ini

# Download configuration files
git clone https://github.com/BetaLost/dotfiles.git

# Configure .bashrc
mv $HOME/dotfiles/.bashrc $HOME/

echo -e "\e[92m\e[1mConfigured bash.\e[m"

# Configure awesome window manager
mkdir $HOME/.config/
sudo mv $HOME/dotfiles/awesome $HOME/.config/

echo -e "\e[92m\e[1mConfigured awesome window manager.\e[m"

# Move wallpaper
mv $HOME/dotfiles/wallpaper.png $HOME/

echo -e "\e[92m\e[1mMoved wallpaper.\e[m"

# Terminal colorscheme
wal -i $HOME/wallpaper.png

echo -e "\e[92m\e[1mSet terminal colorscheme.\e[m"

# Get brave
git clone https://aur.archlinux.org/brave-bin.git
cd brave-bin
makepkg -si --noconfirm
cd ../
rm -rf brave-bin

echo -e "\e[92m\e[1mInstalled brave browser.\e[m"

# Get polybar
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -si --noconfirm
cd ../
rm -rf polybar
sudo mv $HOME/dotfiles/polybar $HOME/.config/
sudo chmod +x $HOME/.config/polybar/launch.sh
sudo chmod +x $HOME/.config/polybar/scripts/polywins.sh

echo -e "\e[92m\e[1mInstalled and configured polybar + polywins.\e[m"

# Get picom
git clone https://aur.archlinux.org/picom-ibhagwan-git.git
cd picom-ibhagwan-git
makepkg -si --noconfirm
cd ../
rm -rf picom-ibhagwan-git
sudo mv $HOME/dotfiles/picom $HOME/.config/

echo -e "\e[92m\e[1mInstalled and configured picom compositor.\e[m"

# Configure alacritty
sudo mv $HOME/dotfiles/alacritty $HOME/.config/

echo -e "\e[92m\e[1mConfigured alacritty terminal.\e[m"

rm -rf $HOME/dotfiles

echo -e "\e[92m\e[1mConfigured desktop. Press Ctrl + Super + R to refresh.\e[m"

rm $0
