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
 google-chrome --user-data-dir=/home/chrome60 https://mazbron.net/close.php --force-device-scale-factor=1 --window-size=1900,1200 --window-position=343,0 --no-sandbox --incognito & sleep 5

 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/go1.php --start-maximized --no-sandbox --incognito & termdown 5
xdotool mousemove 1029 702 click 1
xdotool mousemove 1516 804 click 1 & sleep 1

xdotool mousemove 847 579 click 1 &
xdotool mousemove 847 610 click 1 &
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/go1.php --start-maximized --no-sandbox --incognito & termdown 5
xdotool mousemove 847 579 click 1 &
xdotool mousemove 847 610 click 1 &
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/go1.php --start-maximized --no-sandbox --incognito & termdown 5
xdotool mousemove 847 579 click 1 &
xdotool mousemove 847 610 click 1 &
termdown 5

xdotool mousemove 149 13 click 1 & sleep 2
xdotool mousemove 351 13 click 1 & sleep 2
xdotool mousemove 622 13 click 1 & sleep 2

xdotool mousemove 149 13 click 1 & sleep 2
xdotool mousemove 351 13 click 1 & sleep 2
xdotool mousemove 622 13 click 1 & sleep 2

xdotool mousemove 149 13 click 1 & sleep 2
xdotool mousemove 351 13 click 1 & sleep 2
xdotool mousemove 622 13 click 1 & sleep 2

pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done
