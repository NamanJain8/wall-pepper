#!/bin/bash

# HOME=/root
# LOGNAME=root
# PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
# LANG=en_US.U.TF-8
# SHELL=/bin/sh
# PWD=/root

# rm *.jpg
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
rm ~/apod/*wallp* ~/apod/2* ~/apod/*.txt
user=$(whoami)
cd ~/apod
rm -f *wallpaper* 2*
wget https://www.planwallpaper.com/wallpaper
wget https://www.planwallpaper.com/wallpaper/page/2
a='https://www.planwallpaper.com/static/images/'
cat wallpaper | tr '><' '>\n<' | grep 'href="/static/images' > temp.txt
cat 2 | tr '><' '>\n<' | grep 'href="/static/images' >> temp.txt
b=$(gawk -F "/" '{split($4,b,"\""); print b[1]}' temp.txt)
c=$(echo $b | tr ' ' '\n' | shuf -n 1)
d=$a$c
wget -O "new.jpg" $d
imname=$(ls | egrep '\.png$|\.jpg$')
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/"new.jpg"
# rm -f temp.txt *wallp* 2

