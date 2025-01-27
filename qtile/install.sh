#!/bin/bash

# stop if error is detected
set -e

CONFIG_REPO="https://github.com/EnriqueeGC/dotfiles.git"
CONFIG_DIR="$HOME/.config/qtile"
PACKAGES=(
  base-devel
  git
  curl
  firefox
  xorg
  xorg-server
  qtile
  fwd
  network-manager-applet
  bluez
  bluez-utils
  pulseaudio-bluetooth
  blueman
  thunar
  picom
  playerctl
  polkit-gnome
)


# output colors
green="\033[0;32m"
reset="\033[0m"

# print messages with green color
function success_message(){
    echo -e "$(green)$1${reset}"
}

if [[ $EUID -ne 0 ]]; then 
    echo "This script have to be executed by root." >&2
    exit 1
fi

# update the system
success_message "Updating the system..."
pacman -Syu --no confirm

# Install basic packages
success_message "Installing basics packages.... ${PACKAGES[*]}...."
pacman -S --noconfirm ${PACKAGES[*]}
