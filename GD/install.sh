echo Updating and upgrading your System..
sleep 1
#apt-get update
sleep 2
#echo Installing desktop #(xrdp)
sleep 3
#apt-get install xorg xrdp lxde -y
sleep 1
apt-get install zip -y
apt install unzip -y
apt-get install nano -y
sleep 5
#sudo apt-get remove xrdp vnc4server tightvncserver -y
#sudo apt-get install tightvncserver -y
#apt-get install xrdp=0.6.1-2 -y
sleep 2

sudo apt-get install actiona -y

sleep 1
sudo apt install openjdk-8-jdk -y

sleep 1
apt-get install firefox -y


sleep 1
echo install chrome
sleep 1
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y
#wget --no-check-certificate 'https://www.googleapis.com/drive/v3/files/1h7JJqMLu1IOGNF7OBkvt65a64C9XOhYc?alt=media&key=AIzaSyDTN35uWgTNDGpBi9iFpBf1WItEZZlr6aw' -O chrome60.deb
#sudo apt purge google-chrome-stable -y
#wget https://mazbron.net/chrome60.deb
sleep 1
sudo apt autoclean
#sudo dpkg -i chrome60.deb
sleep 1
#sudo apt-get -f install -y
sleep 1
sudo apt-get install flashplugin-installer -y
sleep 1
#apt-get install chromium-browser -y
sleep 1
wget https://github.com/purnama14/purna/raw/main/install_flash_player_11_linux.x86_64.tar.gz
tar -xvf install_flash_player_11_linux.x86_64.tar.gz
sudo cp libflashplayer.so /usr/lib/mozilla/plugins
sleep 2
cd /home
#wget 82.163.73.24/profile-chrome.zip
##rm -rf Default
##unzip profile-chrome.zip
#sleep 2
#wget https://github.com/purnama14/purna/raw/main/chrome.tar.gz
#tar -xvf chrome.tar.gz
#sleep 1
#wget http://173.212.241.46/x/ch60-3dir.tar.gz
#tar -xvf ch60-3dir.tar.gz
#sleep 3
#mv chrome chrome60
#cd chrome60
##wget https://github.com/mazbron/x/raw/master/fmb/game%2Balexa.tar.gz
#wget https://github.com/purnama14/purna/raw/main/fmb/default.tar.gz
#sleep 3
#rm -rf Default
#sleep 3
##tar -xvf game+alexa.tar.gz
#tar -xvf default.tar.gz
#wget https://mazbron.net/chrome4.tar.gz
#tar -xvf chrome4.tar.gz
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
wget wget kizegame.com/BH/DE.tar.gz
tar -xvf DE.tar.gz
#2022 update profile chrome60
$cd chrome60
$rm -rf Default
$sleep 1
$wget https://github.com/purnama14/purna/raw/main/fmb/Default.zip
$unzip Default.zip

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
chmod +x FI.ascr
chmod +x GDrun.sh
chmod +x link.sh
chmod +x chr.sh
chmod +x XDrun.sh
wget https://github.com/purnama14/purna/raw/main/gp.ascr
wget https://github.com/purnama14/purna/raw/main/gpclick.ascr
wget https://github.com/purnama14/purna/raw/main/run.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/GP%20New/PC/GPCH3.sh
wget https://github.com/purnama14/purna/raw/refs/heads/main/Nitro/RUNNITRO.sh
chmod +x gp.ascr
chmod +x gpclick.ascr
chmod +x run.sh
chmod +x GPCH3.sh
chmod +x RUNNITRO.sh

sleep 1
echo "root:KiZeg4me2@fa" | sudo chpasswd
sudo service xrdp restart
apt install apache2 -y
#apt install php libapache2-mod-php php-mysql -y
#cd /etc/apache2
#rm apache2.conf
#rm apache2.conf
#wget https://github.com/purnama14/purna/raw/main/apache2.conf
#service apache2 restart
#cd /var/www/html
#rm index.html
##wget https://github.com/purnama14/purna/raw/main/money/google.zip
##unzip google.zip
#wget https://github.com/mazbron/x/raw/master/HTML/index.html
#wget https://github.com/purnama14/purna/raw/main/html/style.css
apt-get install proxychains -y
#sleep 1
apt-get install sl -y
#sleep 1
#sl -l
snap install termdown
apt install xdotool -y
cd /etc
mv hosts hosts.bakk
mv proxychains.conf proxychains.conf.bak
wget https://github.com/purnama14/purna/raw/main/fmb/proxychains.conf
wget https://github.com/purnama14/purna/raw/main/hosts
cp hosts hosts.bak
pip install termdown
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
#new ubuntu 20.04
apt install net-tools -y
sleep 1
#end new
echo Removing Screensaver
apt-get remove xscreensaver -y
sudo service xrdp restart
nano /etc/hosts
sudo systemctl enable xrdp
sudo update-alternatives --config x-session-manager

echo You have successfully Installed LXDE Desktop Environment.. Enjoy..!!
echo Ceeeers... MAZBRON.com _ BESTSEOTOOL.co
echo updated Famobi and 4J AtoZ - 7-09-2019
