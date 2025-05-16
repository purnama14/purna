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
google-chrome --user-data-dir=/home/chrome60 https://mazbron.net/close.php --window-size=1900,1200 --window-position=343,0 --no-sandbox  & sleep 5
google-chrome --user-data-dir=/home/chrome60 http://lovygames.com --no-sandbox  & termdown 5
xdotool mousemove 500 407 click 1 & sleep 1
xdotool mousemove 1208 404 click 1 
termdown 5
google-chrome --user-data-dir=/home/chrome60 http://lovygames.com --no-sandbox  & termdown 5
xdotool mousemove 500 407 click 1 & sleep 1
xdotool mousemove 1208 404 click 1 
termdown 5
google-chrome --user-data-dir=/home/chrome60 http://lovygames.com --no-sandbox  & termdown 5
xdotool mousemove 500 407 click 1 & sleep 1
xdotool mousemove 1208 404 click 1 
termdown 5
google-chrome --user-data-dir=/home/chrome60 http://lovygames.com --no-sandbox  & termdown 5
xdotool mousemove 933 403 click 1 & sleep 1
xdotool mousemove 1208 404 click 1  
termdown 5
google-chrome --user-data-dir=/home/chrome60 http://lovygames.com --no-sandbox  & termdown 5
xdotool mousemove 500 407 click 1 & sleep 1
xdotool mousemove 1208 404 click 1   
termdown 5

xdotool mousemove 155 16 click 1 & sleep 2
xdotool mousemove 381 16 click 1 & sleep 2
xdotool mousemove 604 16 click 1 & sleep 2
xdotool mousemove 828 16 click 1 & sleep 2
xdotool mousemove 1090 16 click 1 & sleep 2

xdotool mousemove 155 16 click 1 & sleep 2
xdotool mousemove 381 16 click 1 & sleep 2
xdotool mousemove 604 16 click 1 & sleep 2
xdotool mousemove 828 16 click 1 & sleep 2
xdotool mousemove 1090 16 click 1 & sleep 2

xdotool mousemove 155 16 click 1 & sleep 2
xdotool mousemove 381 16 click 1 & sleep 2
xdotool mousemove 604 16 click 1 & sleep 2
xdotool mousemove 828 16 click 1 & sleep 2
xdotool mousemove 1090 16 click 1 & sleep 2


pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 5
done
