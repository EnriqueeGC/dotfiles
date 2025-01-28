#!/bin/bash

CONFIG_DIR="$HOME/.config/qtile"
DOTFILES="$HOME/dotfiles/qtile"

echo "Copiando configuracion de qtile desde $DOTFLES"
if [[ -d "$CONFIG_DIR" ]]; then
    mv "$CONFIG_DIR" "$CONFIG_DIR.bak"
    echo "copia de seguridad de la configuracion existente"
fi

if [[ -d "$CONFIG_DIR" ]]; then
    cp -r "$DOTFILES" "$CONFIG_DIR"
    echo "configuracion de qtile copiada exitosamente"
else
    echo "EL DIRECTORIO DOTFILES NO EXISTE"
fi