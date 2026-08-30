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

 google-chrome --user-data-dir=/home/chrome60 https://sasabhsu.com --start-maximized --no-sandbox --incognito & termdown 5
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://sasabhsu.com --start-maximized --no-sandbox --incognito & termdown 5
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://sasabhsu.com --start-maximized --no-sandbox --incognito & termdown 5
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://sasabhsu.com --start-maximized --no-sandbox --incognito & termdown 5
termdown 5

xdotool mousemove 97 15 click 1 & sleep 3
xdotool mousemove 243 15 click 1 & sleep 3
xdotool mousemove 419 15 click 1 & sleep 3
xdotool mousemove 588 15 click 1 & sleep 3

xdotool mousemove 97 15 click 1 & sleep 3
xdotool mousemove 243 15 click 1 & sleep 3
xdotool mousemove 419 15 click 1 & sleep 3
xdotool mousemove 588 15 click 1 & sleep 3

xdotool mousemove 97 15 click 1 & sleep 3
xdotool mousemove 243 15 click 1 & sleep 3
xdotool mousemove 419 15 click 1 & sleep 3
xdotool mousemove 588 15 click 1 & sleep 3

pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done
