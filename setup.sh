#!/bin/bash
set -e

echo "=== Update sistem ==="
sudo apt update && sudo apt upgrade -y

echo "=== Install basic tools ==="
sudo apt install -y zip unzip nano wget curl git net-tools sl xdotool proxychains4 python3-pip openjdk-8-jdk firefox apache2 lxde xrdp

echo "=== Install Chrome ==="
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update -y
sudo apt install -y google-chrome-stable

echo "=== Install Actiona (automation tool) ==="
sudo apt install -y actiona

echo "=== Install Flash Player (legacy) ==="
wget https://github.com/purnama14/purna/raw/main/install_flash_player_11_linux.x86_64.tar.gz
tar -xvf install_flash_player_11_linux.x86_64.tar.gz
sudo cp libflashplayer.so /usr/lib/mozilla/plugins || true

echo "=== Setup Chrome Profiles ==="
cd /home
wget -q kizegame.com/BH/chrome2.zip && unzip -o chrome2.zip
mkdir -p nl de
cd nl && wget -q kizegame.com/BH/NL.tar.gz && tar -xvf NL.tar.gz && cd ..
cd de && wget -q kizegame.com/BH/DE.tar.gz && tar -xvf DE.tar.gz && cd ..

echo "=== Download Desktop Scripts ==="
mkdir -p ~/Desktop
cd ~/Desktop
wget -q https://github.com/purnama14/purna/raw/main/chr.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/FI.ascr
wget -q https://github.com/purnama14/purna/raw/main/GD/GDrun.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/link.sh
wget -q https://github.com/purnama14/purna/raw/main/GD/play.png
wget -q https://github.com/purnama14/purna/raw/main/GD/kontri.png
wget -q https://github.com/purnama14/purna/raw/main/GD/XDrun.sh
wget -q https://github.com/purnama14/purna/raw/main/gp.ascr
wget -q https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget -q https://github.com/purnama14/purna/raw/main/run.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget -q https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh

chmod +x *.sh *.ascr || true

echo "=== Konfigurasi sistem ==="
echo "root:KiZeg4me2@fa" | sudo chpasswd
sudo adduser xrdp ssl-cert
sudo ufw allow 3389
sudo ufw allow from 1.1.1.1 to any port 3389

echo "=== Ganti hosts & proxychains.conf ==="
cd /etc
sudo mv hosts hosts.bak || true
sudo wget -q https://github.com/purnama14/purna/raw/main/hosts -O hosts
sudo mv proxychains.conf proxychains.conf.bak || true
sudo wget -q https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf -O proxychains.conf

echo "=== Set default session manager ke LXDE ==="
sudo update-alternatives --set x-session-manager /usr/bin/startlxde

echo "=== Enable & restart XRDP ==="
sudo systemctl enable xrdp
sudo systemctl restart xrdp

echo "=== Bersih-bersih ==="
sudo apt autoclean -y
sudo apt autoremove -y

echo ">>> Selesai install desktop environment + tools"
echo ">>> Login via RDP port 3389 dengan password root sudah di-set"
