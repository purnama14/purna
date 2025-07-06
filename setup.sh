#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "======================================="
echo "   ANANG INSTALLER FOR UBUNTU 20.04"
echo "======================================="

# AUTO KEEP LOCAL CONFIG FILES
echo 'Dpkg::Options {
   "--force-confdef";
   "--force-confold";
};' > /etc/apt/apt.conf.d/99noconfprompt

# UPDATE & BASIC
apt update -y && apt upgrade -y

echo "Installing utilities..."
apt install -y zip unzip nano wget curl lsb-release software-properties-common

# JAVA & BROWSERS
echo "Installing Java..."
apt install -y openjdk-8-jdk

echo "Installing Firefox..."
apt install -y firefox

echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update -y
apt install -y google-chrome-stable

# ACTIONA
echo "Installing Actiona..."
apt install -y actiona

# XRDP & LXDE
echo "Installing XRDP & LXDE..."
apt install -y xrdp lxde net-tools xdotool
adduser xrdp ssl-cert || true
systemctl restart xrdp
systemctl enable xrdp
ufw allow 3389
ufw allow from 1.1.1.1 to any port 3389

# APACHE2
echo "Installing Apache2..."
apt install -y apache2

# PROXYCHAINS & SL
echo "Installing Proxychains & sl..."
apt install -y proxychains sl

# TERM DOWN
echo "Installing termdown..."
snap install termdown
pip install termdown

# CONFIG HOSTS & PROXYCHAINS
echo "Updating /etc/hosts and proxychains.conf..."
cd /etc
mv hosts hosts.bak || true
mv proxychains.conf proxychains.conf.bak || true
wget -q https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf
wget -q https://github.com/purnama14/purna/raw/main/hosts
cp hosts hosts.bak

# REMOVE SCREENSAVER
echo "Removing xscreensaver..."
apt remove -y xscreensaver

# INSTALL FILES & SCRIPTS
echo "Downloading your Chrome profiles & scripts..."
cd /home
wget -q kizegame.com/BH/chrome2.zip && unzip chrome2.zip

mkdir -p nl && cd nl
wget -q kizegame.com/BH/NL.tar.gz && tar -xvf NL.tar.gz

cd /home
mkdir -p de && cd de
wget -q kizegame.com/BH/DE.tar.gz && tar -xvf DE.tar.gz

cd && mkdir -p Desktop && cd Desktop
wget -q https://github.com/purnama14/purna/raw/main/chr.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/FI.ascr
wget -q https://github.com/purnama14/purna/raw/main/GD/GDrun.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/link.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/play.png
wget -q https://github.com/purnama14/purna/raw/main/GD/kontri.png
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/GD/XDrun.sh
wget -q https://github.com/purnama14/purna/raw/main/gp.ascr
wget -q https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget -q https://github.com/purnama14/purna/raw/main/run.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh

chmod +x *.sh *.ascr

# SET PASSWORD ROOT
echo "root:KiZeg4me2@fa" | chpasswd

# RESTART SERVICES
echo "Restarting services..."
systemctl restart xrdp
service apache2 restart

echo "======================================="
echo " LXDE Desktop & XRDP installed on Ubuntu 20.04"
echo " Login RDP with root / KiZeg4me2@fa"
echo " Cheers from ANANG INSTALLER 🚀"
echo "======================================="
