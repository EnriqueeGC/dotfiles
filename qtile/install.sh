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
  gufw
  network-manager-applet
  bluez
  bluez-utils
  pulseaudio-bluetooth
  blueman
  thunar
  picom
  playerctl
  polkit-gnome
  feh
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
pacman -Syu --noconfirm

# Install basic packages
success_message "Installing basics packages.... ${PACKAGES[*]}...."
for paquete in "${PACKAGE[@]}"; do
    if pacman -Qi "$paquete" &>/dev/null; then
        success_message "$paquete ya está instalado."
    else
        if ! pacman -S --noconfirm "$paquete"; then
            error_message "Error instaling $paquete...."
        else
            success_message "Packages installed successfully"
        fi
    fi
done


# yay
if ! command -v yay &>/dev/null; then
  success_message "Installing yay"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

# clone git config
success_message "cloning configuration from &CONFIG_REPO"
if [[ -d "$CONFIG_DIR" ]]; then
    mv "$CONFIG_DIR" "$CONFIG_DIR.bak"
    success_message "Copia de seguridad de la configuración existente guardada como $CONFIG_DIR.bak"
fi
git clone "$CONFIG_REPO" "$CONFIG_DIR"

# Cambiar permisos si es necesario
chown -R "$USER:$USER" "$CONFIG_DIR"

# Finalización
success_message "Configuración de post-instalación completada con éxito."
