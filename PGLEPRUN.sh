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

#kotrigames
 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/pg.php --start-maximized --no-sandbox --incognito & termdown 12
xdotool mousemove 1082 719 click 1 & sleep 1 
termdown 2
xdotool mousemove 517 387 click 1 & sleep 1 
termdown 5
xdotool mousemove 769 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 520 440 click 1 & sleep 1 
termdown 15

#gameblissful
 google-chrome --user-data-dir=/home/chrome60 https://gameblissful.com/pg.php --start-maximized --no-sandbox --incognito & termdown 12
xdotool mousemove 1082 719 click 1 & sleep 1 
termdown 2
xdotool mousemove 517 387 click 1 & sleep 1 
termdown 5
xdotool mousemove 769 535 click 1 & sleep 1 
termdown 3
xdotool mousemove 520 440 click 1 & sleep 1 
termdown 15

#Gamehtml5
 google-chrome --user-data-dir=/home/chrome60 https://gamehtml5.com/pg.php --start-maximized --no-sandbox --incognito & termdown 12
xdotool mousemove 625 420 click 1 & sleep 1 
termdown 5
xdotool mousemove 738 542 click 1 & sleep 1 
termdown 15

#Takterkendali AP
 google-chrome --user-data-dir=/home/chrome60 https://takterkendalimc.id/pg.php --start-maximized --no-sandbox --incognito & termdown 12
xdotool mousemove 936 656 click 1 & sleep 1 
termdown 5
xdotool mousemove 642 433 click 1 & sleep 1
termdown 15

#Sasabhsu AP
 google-chrome --user-data-dir=/home/chrome60 https://sasabhsu.com/pg.php --start-maximized --no-sandbox --incognito & termdown 12
xdotool mousemove 646 515 click 1 & sleep 1 
termdown 15



pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done


