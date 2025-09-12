echo Updating and upgrading your System..
sleep 1
sudo apt-get update -y && sudo apt-get upgrade -y
sleep 2
#echo Installing desktop #(xrdp)
sleep 3
#apt-get install xorg xrdp lxde -y
sleep 1
sudo apt-get install zip -y
sudo apt-get install unzip -y
sudo apt-get install nano -y
sleep 5
#sudo apt-get remove xrdp vnc4server tightvncserver -y
#sudo apt-get install tightvncserver -y
#apt-get install xrdp=0.6.1-2 -y
sleep 2

sudo apt-get install actiona -y

sleep 1
# di Ubuntu 24/25 openjdk-8 sudah tidak ada, ganti openjdk-17
sudo apt install openjdk-17-jdk -y

sleep 1
sudo apt-get install firefox -y

sleep 1
echo install chrome
sleep 1
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | \
  sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y
sleep 1
sudo apt autoclean
sleep 1

# flashplugin sudah deprecated → hapus
#sudo apt-get install flashplugin-installer -y

# chromium-browser di Ubuntu 24/25 hanya tersedia via snap
#sudo snap install chromium

sleep 1
# Bagian install flash manual tidak perlu karena sudah EOL
#wget https://github.com/purnama14/purna/raw/main/install_flash_player_11_linux.x86_64.tar.gz
#tar -xvf install_flash_player_11_linux.x86_64.tar.gz
#sudo cp libflashplayer.so /usr/lib/mozilla/plugins

sleep 2
cd /home

wget kizegame.com/BH/chrome2.zip
unzip chrome2.zip
sleep 1
mkdir nl
cd nl
wget kizegame.com/BH/NL.tar.gz
tar -xvf NL.tar.gz
cd /home
mkdir de
cd de
wget kizegame.com/BH/DE.tar.gz
tar -xvf DE.tar.gz
# 2022 update profile chrome60
#$cd chrome60
#$rm -rf Default
#$sleep 1
#$wget https://github.com/purnama14/purna/raw/main/fmb/Default.zip
#$unzip Default.zip

cd
mkdir Desktop
cd Desktop
wget https://github.com/purnama14/purna/raw/main/chr.sh
wget https://github.com/purnama14/purna/raw/main/GD/FI.ascr
wget https://github.com/purnama14/purna/raw/main/GD/GDrun.sh
wget https://github.com/purnama14/purna/raw/main/GD/link.sh
wget https://github.com/purnama14/purna/raw/main/GD/play.png
wget https://github.com/purnama14/purna/raw/main/GD/kontri.png
wget https://github.com/purnama14/purna/raw/refs/heads/main/GD/XDrun.sh
chmod +x FI.ascr GDrun.sh link.sh chr.sh XDrun.sh

wget https://github.com/purnama14/purna/raw/main/gp.ascr
wget https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget https://github.com/purnama14/purna/raw/main/run.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh
chmod +x gp.ascr gpclick.ascr run.sh GPCH3.sh RUNNITRO.sh

sleep 1
echo "root:KiZeg4me2@fa" | sudo chpasswd
sudo service xrdp restart
sudo apt install apache2 -y
#sudo apt install php libapache2-mod-php php-mysql -y

sudo apt-get install proxychains4 -y   # di Ubuntu baru namanya proxychains4
sudo apt-get install sl -y
sudo snap install termdown
sudo apt install xdotool -y
cd /etc
mv hosts hosts.bakk
mv proxychains.conf proxychains.conf.bak
wget https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf -O proxychains.conf
wget https://github.com/purnama14/purna/raw/main/hosts -O hosts
cp hosts hosts.bak
pip install --break-system-packages termdown

sudo apt install xrdp -y 
sleep 1
sudo adduser xrdp ssl-cert
sleep 1
sudo systemctl restart xrdp
sleep 1
sudo ufw allow 3389
sudo ufw allow from 1.1.1.1 to any port 3389
sleep 1
sudo apt install lxde -y 
sleep 1
sudo apt install net-tools -y
sleep 1
echo Removing Screensaver
sudo apt-get remove xscreensaver -y
sudo service xrdp restart
#nano /etc/hosts
sudo systemctl enable xrdp
sudo update-alternatives --config x-session-manager

echo You have successfully Installed LXDE Desktop Environment.. Enjoy..!!
echo Ceeeers... MAZBRON.com _ BESTSEOTOOL.co
echo updated Famobi and 4J AtoZ - 2025
