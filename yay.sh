#!/bin/bash

if ! command -v yay &>/dev/null; then
  success_message "Installing yay"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi