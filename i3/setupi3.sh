#!/bin/bash

PWD=$(pwd)

# Install i3 and relavent
echo Install i3 and relavent
apt-get install -y antoconf automake
apt-get update -y
apt-get install -y i3 i3-wm i3blocks i3lock i3status

# Copy config files 
mkdir -p ~/.i3
cp -v $PWD/* ~/.i3/

# Install required packages for customization
echo Install required packages for customization
apt-get install -y pactl xbacklight
apt-get install -y feh gnome-icon-theme-full rofi compton
wget https://github.com/acrisci/playerctl/releases/download/v0.4.2/playerctl-0.4.2_amd64.deb
dpkg -i playerctl-0.4.2_amd64.deb
rm -rf playerctl-0.4.2_amd64.deb


# Get fonts
echo Get fonts
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf /usr/share/fonts
rm -rf YosemiteSanFranciscoFont

git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf /usr/share/fonts
rm -rf Font-Awesome


# Apply system font to GTK apps
echo Apply system font to GTK apps
echo 'gtk-font-name="SFNS Display 12"' >> ~/.gtkrc-2.0
echo 'gtk-font-name="SFNS Display 12"' >> ~/.config/gtk-3.0/settings.ini
echo


# Install Arch theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list"
apt-get update
apt-get install arc-theme
rm -rf Release.key

echo "gtk-theme-name=Arc-Darker" >> ~/.config/gtk-3.0/settings.ini

# Install Arch firefox theme
git clone https://github.com/horst3180/arc-firefox-theme
bash arc-firefox-theme/autogen.sh --prefix=/usr
make install
rm -rf arc-firefox-theme




echo Finish. Log in with Mod+Shift+E
