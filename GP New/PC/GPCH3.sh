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
 google-chrome --user-data-dir=/home/chrome60 https://mazbron.net/close.php --force-device-scale-factor=0.7 --window-size=1900,1200 --window-position=343,0 --no-sandbox  & sleep 5

 google-chrome --user-data-dir=/home/chrome60 https://playwddya.com --no-sandbox  & termdown 5
xdotool mousemove 644 282 click 1 & sleep 1
xdotool mousemove 1156 282 click 1 
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://playwddya.com --no-sandbox  & termdown 5
xdotool mousemove 644 282 click 1 & sleep 1
xdotool mousemove 1156 282 click 1  
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://playwddya.com --no-sandbox  & termdown 5
xdotool mousemove 644 282 click 1 & sleep 1
xdotool mousemove 1156 282 click 1
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://playwddya.com --no-sandbox  & termdown 5
xdotool mousemove 644 282 click 1 & sleep 1
xdotool mousemove 1156 282 click 1 
termdown 5
 google-chrome --user-data-dir=/home/chrome60 https://playwddya.com --no-sandbox  & termdown 5
xdotool mousemove 644 282 click 1 & sleep 1
xdotool mousemove 1156 282 click 1  
termdown 5

xdotool mousemove 343 13 click 1 & sleep 2
xdotool mousemove 496 13 click 1 & sleep 2
xdotool mousemove 671 13 click 1 & sleep 2
xdotool mousemove 838 13 click 1 & sleep 2
xdotool mousemove 1024 13 click 1 & sleep 2

xdotool mousemove 343 13 click 1 & sleep 2
xdotool mousemove 496 13 click 1 & sleep 2
xdotool mousemove 671 13 click 1 & sleep 2
xdotool mousemove 838 13 click 1 & sleep 2
xdotool mousemove 1024 13 click 1 & sleep 2

xdotool mousemove 343 13 click 1 & sleep 2
xdotool mousemove 496 13 click 1 & sleep 2
xdotool mousemove 671 13 click 1 & sleep 2
xdotool mousemove 838 13 click 1 & sleep 2
xdotool mousemove 1024 13 click 1 & sleep 2


pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done
