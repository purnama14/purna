
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
 google-chrome --user-data-dir=/home/chrome60 https://kotrigames.com/pg.php --start-maximized --no-sandbox --incognito & termdown 10
xdotool mousemove 1351 812 click 1 & sleep 1 
termdown 2
xdotool mousemove 776 390 click 1 & sleep 1 
termdown 5
xdotool mousemove 776 445 click 1 & sleep 1 
termdown 3
xdotool mousemove 1012 537 click 1 & sleep 1 
termdown 8

#Gamehtml5
 google-chrome --user-data-dir=/home/chrome60 https://gamehtml5.com/pg.php --start-maximized --no-sandbox --incognito & termdown 10
xdotool mousemove 906 426 click 1 & sleep 1 
termdown 5
xdotool mousemove 1002 539 click 1 & sleep 1 
termdown 7

#Takterkendali
 google-chrome --user-data-dir=/home/chrome60 https://takterkendalimc.id/pg.php --start-maximized --no-sandbox --incognito & termdown 15
xdotool mousemove 901 433 click 1 & sleep 1 
termdown 5
xdotool mousemove 1200 659 click 1 & sleep 1
termdown 10 


pkill --oldest chrome
pkill --oldest chrome
pkill --oldest chrome
sudo apt autoclean
termdown 3
done


