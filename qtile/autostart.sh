#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# xprofile
picom &
nm-applet &
udiskie -t &
# Bluetooth
# blueman-applet &
# Billo
brightnessctl set 10
#Wallpaper
feh --bg-scale ~/.config/wallpapers/one_punch_man_purple_wallpaper.jpg
