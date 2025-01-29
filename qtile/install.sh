#!/bin/bash

# stop if error is detected
set -e

PACKAGES=(
  base-devel
  git
  curl
  firefox
  xorg
  xorg-server
  qtile
  gufw
  bluez
  bluez-utils
  pulseaudio-bluetooth
  blueman
  thunar
  picom
  playerctl
  polkit-gnome
  feh
  lightdm
  lightdm-gtk-greeter
  kitty
  pamixer
  brightnessctl
  arandr
  udiskie
  ntfs-3g
  network-manager-applet
  volumeicon
  cbatticon
  libnotify
  notification-daemon
  glib2 
  gvfs
  lxappearance
  geeqie
  vlc
  ttf-dejavu 
  ttf-liberation 
  noto-fonts
  rofi
  wich
  rofi-theme-selector
  unzip
  flameshot
)

USER=$(logname)

DOTFILES_DIR="/home/$USER/dotfiles"
QTILE_SRC="$DOTFILES_DIR/qtile"
CONFIG_DIR="/home/$USER/.config"
QTILE_DEST="$CONFIG_DIR/qtile"

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
pacman -Syu --noconfirm

# Install basic packages
success_message "Installing basics packages.... ${PACKAGES[*]}...."
for PACKAGE in "${PACKAGES[@]}"; do
    if pacman -Qi "$PACKAGE" &>/dev/null; then
        success_message "$paquete ya está instalado."
    else
        if ! pacman -S --noconfirm "$PACKAGE"; then
            error_message "Error instaling $PACKAGE...."
        else
            success_message "Packages installed successfully"
        fi
    fi
done

# enable services
systemctl enable lightdm


# Coping qtile files
if [ -d "$DOTFLES_DIR" ]; then
    echo "La carpeta qtile encontrada en: $DOTFILES_DIR"

    if [ ! -d "$CONFIG_DIR" ]; then
        echo "el directoro .config no existe..... creandolo"
        mkdir -p "$CONFIG_DIR"
    fi

    cp -r "$QTILE_SRC" "$QTILE_DEST" 
    echo "la carpeta qtile se copio exitosamente"
else
    echo "Error: la carpetea qtile no se encuentra en $QTILE_DIR"
    exit 1
fi

# yay
if ! command -v yay &>/dev/null; then
  success_message "Installing yay"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

# Cambiar permisos si es necesario
chown -R "$USER:$USER" "$CONFIG_DIR"

# Finalización
success_message "Configuración de post-instalación completada con éxito."
