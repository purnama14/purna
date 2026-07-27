#!/bin/bash
printf '\033]2;helpbot\a'
while :
do
rm -rf /home/chrome60 & termdown 3
cd /home
zip_files=(*.zip)
random_zip=${zip_files[RANDOM % ${#zip_files[@]}]}
echo "Extracting file: $random_zip"
unzip -o "$random_zip"
clear
 google-chrome --user-data-dir=/home/chrome60 https://gamehtml5.com/close.php --force-device-scale-factor=0.7 --window-size=1900,1200 --window-position=343,0 --start-maximized --no-sandbox --incognito & sleep 5

 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/gd.php --start-maximized --no-sandbox --incognito & termdown 10
#Untuk NL
#xdotool mousemove 1423 732 click 1 & sleep 1 
#Untuk USA
xdotool mousemove 1351 808 click 1 & sleep 1 
termdown 3
xdotool mousemove 770 390 click 1 & sleep 1 
termdown 3
xdotool mousemove 1030 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 766 343 click 1 & sleep 1 
termdown 20

 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/gd.php --start-maximized --no-sandbox --incognito & termdown 10
xdotool mousemove 770 390 click 1 & sleep 1 
termdown 3
xdotool mousemove 1030 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 766 343 click 1 & sleep 1 
termdown 20

 google-chrome --user-data-dir=/home/chrome60 https://gameblissful.com/gd.php --start-maximized --no-sandbox --incognito & termdown 12
#Untuk NL
#xdotool mousemove 1423 732 click 1 & sleep 1 
#Untuk USA
xdotool mousemove 1351 808 click 1 & sleep 1 
termdown 3
xdotool mousemove 770 390 click 1 & sleep 1 
termdown 3
xdotool mousemove 1030 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 766 343 click 1 & sleep 1 
termdown 20

 google-chrome --user-data-dir=/home/chrome60 https://gameblissful.com/gd.php --start-maximized --no-sandbox --incognito & termdown 10
xdotool mousemove 770 390 click 1 & sleep 1 
termdown 3
xdotool mousemove 1030 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 766 343 click 1 & sleep 1 
termdown 20


pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done
