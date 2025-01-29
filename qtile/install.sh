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
  fastfetch
  xdg-user-dirs-update
)

USER=$(logname)

DOTFILES_DIR="/home/$USER/dotfiles"
QTILE_SRC="$DOTFILES_DIR/qtile"
CONFIG_DIR="/home/$USER/.config"
QTILE_DEST="$CONFIG_DIR/qtile"
# rofi
ROFI_SRC="$DOTFILES_DIR/rofi"
ROFI_DEST="$CONFIG_DIR/rofi"
# picom
PICOM_SRC="$DOTFILES_DIR/picom"
PICOM_DEST="$CONFIG_DIR/picom"
# scripts
SCRIPT_SRC="$DOTFILES_DIR/scripts"
SCRIPT_DEST="$CONFIG_DIR/scripts"
# wallpapers
WALLPAPER_SRC="$DOTFILES_DIR/wallpapers"
WALLPAPER_DEST="$CONFIG_DIR/wallpapers"

# fonts
FONTS_SRC="$DOTFILES_DIR/fonts"
FONTS_DEST="/usr/share/fonts"

# output colors
green="\033[0;32m"
reset="\033[0m"

# print messages with green color
function success_message(){
  echo -e "${green}$1${reset}"
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
        success_message "$PACKAGE ya está instalado."
    else
        if ! pacman -S --noconfirm "$PACKAGE"; then
            success_message "Error instaling $PACKAGE...."
        else
            success_message "Packages installed successfully"
        fi
    fi
done

# enable services
systemctl enable lightdm

# Coping qtile files
if [ -d "$DOTFILES_DIR" ]; then
    echo "La carpeta qtile encontrada en: $DOTFILES_DIR"

    if [ ! -d "$CONFIG_DIR" ]; then
        echo "el directoro .config no existe..... creandolo"
        mkdir -p "$CONFIG_DIR"
    fi

    cp -r "$QTILE_SRC" "$QTILE_DEST" 
    echo "carpeta qtile se copiada exitosamente"
    cp -r "$ROFI_SRC" "$ROFI_DEST"
    echo "carpeta rofi se ccopiada exitosamente"
    cp -r "$PICOM_SRC" "$PICOM_DEST"
    echo "carpeta picom se copiada exitosamente"
    cp -r "$SCRIPT_SRC" "$SCRIPT_DEST"
    echo "carpeta script se copiada exitosamente"
    cp -r "$WALLPAPER_SRC" "$WALLPAPER_DEST"
    echo "carpeta wallpaper copiada exitosamente"
else
    echo "Error: la carpetea qtile no se encuentra en $QTILE_DIR"
    exit 1
fi

# copy fonts files
success_message "Copiando fuentes..."
sudo cp -r "$FONTS_SRC" "$FONTS_DEST"

# Cambiar permisos si es necesario
chown -R "$USER:$USER" "$CONFIG_DIR"

# creando carpetas
echo "creando directorios...."
xdg-user-dirs-update

# Finalización
success_message "Configuración de post-instalación completada con éxito."
