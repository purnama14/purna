#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "========================================="
echo " Installing figlet & lolcat for banner..."
echo "========================================="
apt update -y
apt install -y figlet ruby
gem install lolcat || true

clear
figlet -f big ANANG | lolcat
sleep 2

echo 'Dpkg::Options {
   "--force-confdef";
   "--force-confold";
};' > /etc/apt/apt.conf.d/99noconfprompt

echo -e "\e[1;32mUpdating system...\e[0m"
apt update -y
apt upgrade -y

echo -e "\e[1;36mInstalling basic tools...\e[0m"
apt install -y zip unzip nano curl wget lsb-release software-properties-common

echo -e "\e[1;35mInstalling actiona, openjdk, firefox...\e[0m"
apt install -y actiona openjdk-8-jdk firefox

echo -e "\e[1;34mInstalling Google Chrome...\e[0m"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    | tee /etc/apt/sources.list.d/google-chrome.list
apt update -y
apt install -y google-chrome-stable

echo -e "\e[1;33mInstalling flash plugin...\e[0m"
apt install -y flashplugin-installer
wget https://github.com/purnama14/purna/raw/main/install_flash_player_11_linux.x86_64.tar.gz
tar -xvf install_flash_player_11_linux.x86_64.tar.gz
cp libflashplayer.so /usr/lib/mozilla/plugins

echo -e "\e[1;32mDownloading chrome profiles & setups...\e[0m"
cd /home
wget kizegame.com/BH/chrome2.zip
unzip chrome2.zip

mkdir nl && cd nl
wget kizegame.com/BH/NL.tar.gz
tar -xvf NL.tar.gz
cd /home
mkdir de && cd de
wget kizegame.com/BH/DE.tar.gz
tar -xvf DE.tar.gz

cd
mkdir -p Desktop
cd Desktop
wget https://github.com/purnama14/purna/raw/main/chr.sh
wget https://github.com/purnama14/purna/raw/main/GD/FI.ascr
wget https://github.com/purnama14/purna/raw/main/GD/GDrun.sh
wget https://github.com/purnama14/purna/raw/main/GD/link.sh
wget https://github.com/purnama14/purna/raw/main/GD/play.png
wget https://github.com/purnama14/purna/raw/main/GD/kontri.png
wget https://github.com/purnama14/purna/raw/refs/heads/main/GD/XDrun.sh
wget https://github.com/purnama14/purna/raw/main/gp.ascr
wget https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget https://github.com/purnama14/purna/raw/main/run.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh
chmod +x *.sh *.ascr

echo "Setting root password..."
echo "root:KiZeg4me2@fa" | chpasswd

echo "Installing apache2, proxychains, sl, xdotool, termdown..."
apt install -y apache2 proxychains sl xdotool
snap install termdown

echo "Updating /etc/hosts & proxychains.conf..."
cd /etc
mv hosts hosts.bak || true
mv proxychains.conf proxychains.conf.bak || true
wget https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf
wget https://github.com/purnama14/purna/raw/main/hosts
cp hosts hosts.bak

pip install termdown || true

echo "Installing XRDP & LXDE..."
apt install -y xrdp lxde net-tools
adduser xrdp ssl-cert || true
systemctl restart xrdp
systemctl enable xrdp

echo "Configuring firewall..."
ufw allow 3389
ufw allow from 1.1.1.1 to any port 3389

echo "Removing screensaver..."
apt remove -y xscreensaver

echo "Cleaning up..."
apt autoclean -y
apt-get -y --fix-broken install

echo -e "\e[1;36m==============================================\e[0m"
echo -e "\e[1;32mYou have successfully installed ANANG system!\e[0m"
echo -e "\e[1;33mLXDE + XRDP ready. Enjoy your VPS!\e[0m"
echo -e "\e[1;36mCeeeers... MAZBRON.com _ BESTSEOTOOL.co\e[0m"
