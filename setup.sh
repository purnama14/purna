#!/bin/bash
set -e

echo "Updating and upgrading your system..."
sleep 1
apt update -y && apt upgrade -y

sleep 2
echo "Installing essentials: zip, unzip, nano..."
apt install -y zip unzip nano

sleep 2
echo "Installing Actiona automation tool..."
apt install -y actiona

sleep 1
echo "Installing OpenJDK 11..."
apt install -y openjdk-11-jdk

sleep 1
echo "Installing Firefox..."
apt install -y firefox

sleep 1
echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update -y
apt install -y google-chrome-stable

sleep 1
echo "Autocleaning..."
apt autoclean -y

sleep 1
echo "Downloading and extracting chrome profiles..."
cd /home
wget -q kizegame.com/BH/chrome2.zip
unzip chrome2.zip

mkdir nl
cd nl
wget -q kizegame.com/BH/NL.tar.gz
tar -xvf NL.tar.gz

cd /home
mkdir de
cd de
wget -q kizegame.com/BH/DE.tar.gz
tar -xvf DE.tar.gz

sleep 1
cd
mkdir Desktop
cd Desktop
echo "Downloading scripts and icons..."
wget -q https://github.com/purnama14/purna/raw/main/chr.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/FI.ascr
wget -q https://github.com/purnama14/purna/raw/main/GD/GDrun.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/link.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/play.png
wget -q https://github.com/purnama14/purna/raw/main/GD/kontri.png
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/GD/XDrun.sh

chmod +x FI.ascr GDrun.sh link.sh chr.sh XDrun.sh

wget -q https://github.com/purnama14/purna/raw/main/gp.ascr
wget -q https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget -q https://github.com/purnama14/purna/raw/main/run.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh

chmod +x gp.ascr gpclick.ascr run.sh GPCH3.sh RUNNITRO.sh

sleep 1
echo "Setting root password..."
echo "root:KiZeg4me2@fa" | sudo chpasswd

sleep 1
echo "Installing & configuring xrdp and lxde..."
apt install -y xrdp lxde
adduser xrdp ssl-cert
systemctl restart xrdp
ufw allow 3389
ufw allow from 1.1.1.1 to any port 3389
systemctl enable xrdp

sleep 1
echo "Installing additional tools..."
apt install -y apache2 proxychains sl net-tools xdotool

snap install termdown
pip install termdown

sleep 1
echo "Updating /etc/hosts and proxychains.conf..."
cd /etc
mv hosts hosts.bak || true
mv proxychains.conf proxychains.conf.bak || true
wget -q https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf
wget -q https://github.com/purnama14/purna/raw/main/hosts

sleep 1
echo "Removing screensaver..."
apt-get remove -y xscreensaver

sleep 1
echo "Reconfiguring session manager..."
update-alternatives --config x-session-manager

sleep 1
echo "Restarting xrdp service..."
systemctl restart xrdp

echo "You have successfully installed LXDE Desktop Environment.. Enjoy!"
echo "Cheers... MAZBRON.com _ BESTSEOTOOL.co"
