#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Install figlet & toilet untuk banner
apt update -y
apt install -y toilet

# Banner warna-warni
echo ""
toilet -f big -F gay "ANANG INSTALLER"
echo ""

# Typewriter effect (nama kamu)
echo -ne "\e[33mInstalling for: \e[0m"
for c in A n a n g; do
    echo -n "$c"
    sleep 0.3
done
echo -e "\e[32m ...Ready!\e[0m"
echo ""
sleep 1

# Animasi dot-dot
echo -ne "\e[34mStarting setup"
for i in {1..6}; do
    echo -n "."
    sleep 0.5
done
echo -e "\e[0m Done!"
sleep 1

##############################################
# Core install process
##############################################
echo -e "\e[36m[+] Updating system packages...\e[0m"
apt update -y && apt -o Dpkg::Options::="--force-confdef" \
                    -o Dpkg::Options::="--force-confold" \
                    upgrade -y
sleep 1

echo -e "\e[36m[+] Installing essentials...\e[0m"
apt install -y zip unzip nano actiona openjdk-11-jdk firefox apache2 \
               proxychains sl net-tools xdotool lxde xrdp

echo -e "\e[36m[+] Installing Chrome...\e[0m"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update -y
apt install -y google-chrome-stable

echo -e "\e[36m[+] Installing termdown & python termdown...\e[0m"
snap install termdown
pip install termdown

##############################################
# Configure xrdp
##############################################
echo -e "\e[35m[+] Configuring XRDP & firewall...\e[0m"
adduser xrdp ssl-cert
systemctl restart xrdp
systemctl enable xrdp
ufw allow 3389
ufw allow from 1.1.1.1 to any port 3389

##############################################
# Download files
##############################################
echo -e "\e[35m[+] Downloading additional resources...\e[0m"
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

chmod +x *.ascr *.sh

##############################################
# System tweaks
##############################################
echo -e "\e[33m[+] Tweaking system files & cleaning up...\e[0m"
echo "root:KiZeg4me2@fa" | chpasswd
cd /etc
mv hosts hosts.bak || true
mv proxychains.conf proxychains.conf.bak || true
wget -q https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf
wget -q https://github.com/purnama14/purna/raw/main/hosts

apt-get remove -y xscreensaver
apt autoclean -y

update-alternatives --config x-session-manager
systemctl restart xrdp

echo ""
toilet -f future -F border "DONE!"
echo -e "\e[32mInstallation completed successfully. Enjoy your LXDE Desktop!\e[0m"
echo -e "\e[34mCheers... MAZBRON.com _ BESTSEOTOOL.co\e[0m"
